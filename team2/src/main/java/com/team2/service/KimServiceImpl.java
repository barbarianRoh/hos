package com.team2.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.Date;
import java.util.Objects;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.mapper.KimMapper;

@Service
public class KimServiceImpl implements KimService {

	@Autowired
	private KimMapper mapper;
	
	public String chatbotArtineer(String voiceMessage) {
        String secretKey = "WmdzZlhmZ250RXhDQkNyVU11anRYcUVRRkxnV055bHI=";
        String apiURL = "https://4y1xd9dljl.apigw.ntruss.com/custom/v1/10986/7bf9e2e8d2a63506fe6c922f20d22415594fc76cb451105812ba223ee1f2fc5e";

        String chatbotMessage = ""; // 응답 메세지
        try {
            //String apiURL = "https://ex9av8bv0e.apigw.ntruss.com/custom_chatbot/prod/";

            URL url = new URL(apiURL);

            String message = getReqMessage(voiceMessage);
            System.out.println("##" + message);

            String encodeBase64String = makeSignature(message, secretKey);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

            // post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(message.getBytes("UTF-8"));
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();

            BufferedReader br;

            if(responseCode==200) { // Normal call
                System.out.println(con.getResponseMessage());

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(
                                con.getInputStream()));
                String decodedString;
                while ((decodedString = in.readLine()) != null) {
                    chatbotMessage = decodedString;
                }
                //chatbotMessage = decodedString;
                in.close();
                // 응답 메세지 출력
                System.out.println(chatbotMessage);
//                chatbotMessage = jsonToString(chatbotMessage);
//                서비스에서 JSON 파싱하지 않고 자바스크립트로 전송하여 자바스크립트에서 파싱
            } else {  // Error occurred
                chatbotMessage = con.getResponseMessage();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return chatbotMessage;
    }
	
	
    public String main(String voiceMessage) {
        String secretKey = "WmdzZlhmZ250RXhDQkNyVU11anRYcUVRRkxnV055bHI=";
        String apiURL = "https://4y1xd9dljl.apigw.ntruss.com/custom/v1/10986/7bf9e2e8d2a63506fe6c922f20d22415594fc76cb451105812ba223ee1f2fc5e";

        String chatbotMessage = ""; // 응답 메세지
        try {
            //String apiURL = "https://ex9av8bv0e.apigw.ntruss.com/custom_chatbot/prod/";

            URL url = new URL(apiURL);

            String message = getReqMessage(voiceMessage);
            System.out.println("##" + message);

            String encodeBase64String = makeSignature(message, secretKey);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

            // post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(message.getBytes("UTF-8"));
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();

            BufferedReader br;

            if(responseCode==200) { // Normal call
                System.out.println(con.getResponseMessage());

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(
                                con.getInputStream()));
                String decodedString;
                while ((decodedString = in.readLine()) != null) {
                    chatbotMessage = decodedString;
                }
                //chatbotMessage = decodedString;
                in.close();
                // 응답 메세지 출력
                System.out.println(chatbotMessage);
                chatbotMessage = jsonToString(chatbotMessage);
            } else {  // Error occurred
                chatbotMessage = con.getResponseMessage();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return chatbotMessage;
    }
    public static String makeSignature(String message, String secretKey) {

        String encodeBase64String = "";

        try {
            byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

            SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);

            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
//            encodeBase64String = Base64.encodeToString(rawHmac, Base64.NO_WRAP);
            encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);

            return encodeBase64String;

        } catch (Exception e){
            System.out.println(e);
        }

        return encodeBase64String;

    }
    
    public String clovaTextToSpeech2(String message) {
        String clientId = "https://4y1xd9dljl.apigw.ntruss.com/custom/v1/10986/7bf9e2e8d2a63506fe6c922f20d22415594fc76cb451105812ba223ee1f2fc5e";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "WmdzZlhmZ250RXhDQkNyVU11anRYcUVRRkxnV055bHI=";//애플리케이션 클라이언트 시크릿값";
        String voiceFileName = "";
        try {
            String text = URLEncoder.encode(message, "UTF-8"); // 13자
            String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            // post request
            String postParams = "speaker=nara&volume=0&speed=0&pitch=0&format=mp3&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                // 랜덤한 이름으로 mp3 파일 생성
                String tempname = Long.valueOf(new Date().getTime()).toString();
                voiceFileName = "tts_" + tempname + ".mp3";
                File f = new File("/Users/gobyeongchae/Desktop/" + voiceFileName);
                f.createNewFile();
                OutputStream outputStream = new FileOutputStream(f);
                while ((read =is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return voiceFileName;
    }

    public static String getReqMessage(String voiceMessage) {

        String requestBody = "";

        try {

            JSONObject obj = new JSONObject();

            long timestamp = new Date().getTime();

            System.out.println("##"+timestamp);

            obj.put("version", "v2");
            obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
//=> userId is a unique code for each chat user, not a fixed value, recommend use UUID. use different id for each user could help you to split chat history for users.

            obj.put("timestamp", timestamp);

            JSONObject bubbles_obj = new JSONObject();

            bubbles_obj.put("type", "text");

            JSONObject data_obj = new JSONObject();
            data_obj.put("description", voiceMessage);

            bubbles_obj.put("type", "text");
            bubbles_obj.put("data", data_obj);

            JSONArray bubbles_array = new JSONArray();
            bubbles_array.put(bubbles_obj);

            obj.put("bubbles", bubbles_array);
//            obj.put("event", "send");

            if(Objects.equals(voiceMessage, "")) {
                obj.put("event", "open"); // 월컴 메세지
            } else {
                obj.put("event", "send");
            }
            requestBody = obj.toString();
            // 웰컴 메세지 출력


        } catch (Exception e){
            System.out.println("## Exception : " + e);
        }
        return requestBody;
    }
    
    
    
    
    public String jsonToString(String jsonResultStr) {
    	String resultText = "";
    	try {
    		JSONObject jsonObj = new JSONObject(jsonResultStr);
    		JSONArray chatArray = jsonObj.getJSONArray("bubbles");
    		if(chatArray != null && chatArray.length() > 0) {
    			JSONObject tempObj = chatArray.getJSONObject(0);
    			if(tempObj.has("data")) {
    				JSONObject dataObj = tempObj.getJSONObject("data");
    				if(dataObj.has("description")) {
    					resultText = dataObj.getString("description");
    				}
    			}
    		} else {
    			System.out.println("없음");
    		}
    	} catch (Exception e) {
    		System.out.println("##Excetion:"+ e);
    	}
    	return resultText;
    }
    
    
    
   /* public String jsonToString(String jsonResultStr) {
        String resultText = "";
        // API 호출 결과 받은 JSON 형태 문자열에서 텍스트 추출
        // JSONParser  사용하지 않음
        JSONObject jsonObj = new JSONObject(jsonResultStr);
        JSONArray chatArray = jsonObj.getJSONArray("bubbles");
        if(chatArray != null && chatArray.length() > 0) {
            JSONObject tempObj = chatArray.getJSONObject(0);
            JSONObject dataObj = tempObj.getJSONObject("data");
            if(dataObj != null) {
//                tempObj = (JSONObject) dataObj.get("description");
                resultText = dataObj.getString("description");
            }
        } else {
            System.out.println("없음");
        }
        return resultText;
	
    }*/
}