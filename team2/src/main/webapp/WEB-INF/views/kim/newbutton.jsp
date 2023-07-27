<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dynamic Button Creation</title>
    <style>
        /* Style for the new buttons */
        .new-button {
            background-color: #4CAF50; /* Green background color */
            border: none; /* Remove the border */
            color: white; /* White text color */
            padding: 10px 20px; /* Add padding */
            text-align: center; /* Center-align text */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Make it display as a block */
            margin: 4px 2px; /* Add margin */
            cursor: pointer; /* Add cursor pointer on hover */
            border-radius: 4px; /* Rounded corners */
        }

        /* Style for the new buttons on hover */
        .new-button:hover {
            background-color: #45a049; /* Dark green background color on hover */
        }
    </style>
</head>
<body>
    <button id="Urology" class="ghost-button5" onclick="createNewButton('Urology')">Urology</button>
    <div id="buttonContainer-Urology" class="add-Ubutton"></div>

    <button id="head" class="ghost-button" onclick="createNewButton('head')">Head</button>
    <div id="buttonContainer-head" class="add-Hbutton"></div>

    <script>
        function createNewButton(buttonType) {
            let containerId;
            let newButtonClassName;
            let newButtonLabels = [];

            if (buttonType === 'Urology') {
                containerId = 'buttonContainer-Urology';
                newButtonClassName = 'new-Ubutton';
                newButtonLabels = [
                    { label: 'Pain', link: 'https://www.example.com/pain' },
                    { label: 'Hematuria', link: 'https://www.example.com/hematuria' },
                    { label: 'Incontinence', link: 'https://www.example.com/incontinence' }
                ];

                // Delete the buttons created in "buttonContainer-head"
                let containerHead = document.getElementById('buttonContainer-head');
                while (containerHead.firstChild) {
                    containerHead.removeChild(containerHead.firstChild);
                }
            } else if (buttonType === 'head') {
                containerId = 'buttonContainer-head';
                newButtonClassName = 'new-Hbutton';
                newButtonLabels = [
                    { label: 'Headache', link: 'https://www.example.com/headache' },
                    { label: 'Dizziness', link: 'https://www.example.com/dizziness' },
                    { label: 'Facial tremor', link: 'https://www.example.com/facial-tremor' },
                    { label: 'Migraine', link: 'https://www.example.com/migraine' },
                    { label: 'Hand tremor', link: 'https://www.example.com/hand-tremor' }
                ];

                // Delete buttons created in "buttonContainer-Urology"
                let containerUrology = document.getElementById('buttonContainer-Urology');
                while (containerUrology.firstChild) {
                    containerUrology.removeChild(containerUrology.firstChild);
                }
            }

            let container = document.getElementById(containerId);
            newButtonLabels.forEach((buttonData) => {
                let newButton = document.createElement('button');
                newButton.className = `new-button ${newButtonClassName}`; // Add the "new-button" class
                newButton.innerHTML = buttonData.label;

                // Add a click event listener to the new button
                newButton.addEventListener('click', function () {
                    window.location.href = buttonData.link;
                });

                container.appendChild(newButton);
            });

            // Remove the click event listener of the current button
            document.getElementById(buttonType).removeEventListener('click', function () {
                createNewButton(buttonType);
            });
        }
    </script>
</body>
</html>
