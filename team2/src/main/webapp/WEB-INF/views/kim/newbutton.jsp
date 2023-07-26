<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/hos/resources/css/symptom.css">    
<!DOCTYPE html>
<html>
<head>
    <title>버튼 생성 예제</title>
    <style>
        /* Style for the "Create New Button" */
        #createButton {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Style for the dynamically created buttons */
        .new-button {
            padding: 10px 20px;
            background-color: #ff0000;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 5px;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <button id="createButton">Create New Button</button>
    <div id="buttonContainer">
        <!-- New buttons will be added here -->
    </div>

    <script>
        document.getElementById("createButton").addEventListener("click", function() {
            // Create new button elements with different classes
            var newButton1 = document.createElement("button");
            var newButton2 = document.createElement("button");
            newButton1.className = "new-button";
            newButton2.className = "new-button";

            // Set the button text for each new button
            newButton1.innerHTML = "New Button 1";
            newButton2.innerHTML = "New Button 2";

            // Append the new buttons to the button container
            document.getElementById("buttonContainer").appendChild(newButton1);
            document.getElementById("buttonContainer").appendChild(newButton2);
        });
    </script>
</body>
</html>
