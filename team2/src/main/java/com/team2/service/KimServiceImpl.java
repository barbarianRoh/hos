package com.team2.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.Date;

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
                                con.getInputStream(),"UTF-8"));
                String decodedString;
                while ((decodedString = in.readLine()) != null) {
                    chatbotMessage = decodedString;
                }
                //chatbotMessage = decodedString;
                in.close();
                
                // 응답 메세지 출력
                System.out.println(chatbotMessage);
            } else {  // Error occurred
                chatbotMessage = con.getResponseMessage();
                System.out.println(con.getResponseCode());
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
            obj.put("event", "open");

            requestBody = obj.toString();
            requestBody= "{\"version\": \"v2\",\"userId\": \"U47b00b58c90f8e47428af8b7bddcda3d\",\"userIp\": \"8.8.8.8\",\"timestamp\": 12345678,\"bubbles\": [{\"type\": \"text\",\"data\" : { \"description\" : \"postback text of welcome action\" } } ],\"event\": \"open\"}";
        } catch (Exception e){
            System.out.println("## Exception : " + e);
        }
        return requestBody;
    }
    public String jsonToString(String jsonResultStr) {
        String resultText = "";
        // API 호출 결과 받은 JSON 형태 문자열에서 텍스트 추출
        // JSONParser  사용하지 않음
        JSONObject jsonObj = new JSONObject(jsonResultStr);
        JSONArray chatArray = (JSONArray) jsonObj.get("bubbles");
        if(chatArray != null) {
            JSONObject tempObj = (JSONObject) chatArray.get(0);
            JSONObject dataObj = (JSONObject) tempObj.get("data");
            if(dataObj != null) {
//                tempObj = (JSONObject) dataObj.get("description");
                resultText += (String) dataObj.get("description");
            }
        } else {
            System.out.println("없음");
        }
        return resultText;
	
    }
}