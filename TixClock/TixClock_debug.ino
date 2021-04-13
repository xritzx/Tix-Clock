#define FASTLED_ESP8266_D1_PIN_ORDER

#include <FastLED.h>

#include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <FirebaseESP8266.h>
#include <RTClib.h>

#define FAIL_INDICATOR 2

#define PIXEL_PIN 12
#define NUM_LEDS 27

#define WIFI_SSID "Basil"
#define WIFI_PASSWORD "onetonine"

#define FIREBASE_HOST "tixclock-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "fYYeGgGHgV6XWWQ6pDXATGCcRXhANycXbWwClxvW"

FirebaseData fbdo;
RTC_DS1307 rtc;


// The Time format is h,h,m,m
int curr_time[4] = {0, 0, 0, 0};
CRGB leds[NUM_LEDS];
long led_buff[NUM_LEDS];

unsigned long sendDataPrevMillis = 0;

String path = "/";


// Changes the reference color palette
void updatePixel(int index, String HexCode){
  String colorS = HexCode.substring(1);
  colorS = "0x"+colorS;
  long color = strtol(colorS.c_str(), NULL, 16);
  led_buff[index] = color;
}

void fetchTime(){
  DateTime now = rtc.now();
  Serial.print(now.hour(), DEC);
  Serial.print(':');
  Serial.println(now.minute(), DEC);
  
  curr_time[0] = (int)now.hour()/10;
  curr_time[1] = (int)now.hour()%10;
  curr_time[2] = (int)now.minute()/10;
  curr_time[3] = (int)now.minute()%10;
}


void showTime(){
  int x = 0; // LED Index
  for(int i=0; i<=2; i++){
    if(i<curr_time[0]){
      leds[i] = led_buff[i];
    }else{
      leds[i] = 0x000000;
    }
  }
  for(int i=3; i<=11; i++){
    if(i-3<curr_time[1]){
      leds[i] = led_buff[i];
    }else{
      leds[i] =  0x000000;
    }
  }
  for(int i=12; i<=17; i++){
    if(i-12<curr_time[2]){
      leds[i] = led_buff[i];
    }else{
      leds[i] =  0x000000;
    }
  }
  for(int i=18; i<=26; i++){
    if(i-18<curr_time[3]){
      leds[i] = led_buff[i];
    }else{
      leds[i] =  0x000000;
    }
  }
  FastLED.show();
}


void updateNeoPixelsData(){
   
   if (Firebase.get(fbdo, path)){
       Serial.println("PASSED");
        FirebaseJsonArray &arr = fbdo.jsonArray();
        for(size_t i=0; i<arr.size(); i++){
          FirebaseJsonData &jsonData = fbdo.jsonData();
          arr.get(jsonData, i);
          updatePixel(i, jsonData.stringValue);
        }
        FastLED.show();
    }
    else{
       Serial.println("FAILED");
       Serial.println("REASON: " + fbdo.errorReason());
       Serial.println("------------------------------------");
       Serial.println();
    }
}


void setup() {
  Serial.begin(9600);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  if (! rtc.begin()) {
    Serial.println("Couldn't find RTC");
    abort();
  }

//F Strings sets the time during complile time and not run time so the time would be delayed by 20-30 seconds

//  if (!rtc.isrunning()) {
//    Serial.println`("RTC is NOT running, let's set the time!");
//    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
//  }

  Serial.println("Connecting...");

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);
  fbdo.setBSSLBufferSize(1024, 1024);
  fbdo.setResponseSize(1024);

  FastLED.addLeds<WS2812, PIXEL_PIN, GRB>(leds, NUM_LEDS);
  FastLED.setBrightness(10);
}

void loop() {
  EVERY_N_SECONDS(10){
    updateNeoPixelsData();
  }
  EVERY_N_SECONDS(5){
    fetchTime();
    showTime();
  }
}