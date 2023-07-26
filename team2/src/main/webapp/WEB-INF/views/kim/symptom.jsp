<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script defer type="text/javascript" src="/hos/resources/js/body.content.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/hos/resources/css/symptom.css">
<title>증상체크</title>
</head>
	<!-- 버튼 디자인 -->


<body>
	<div class ="symptompage">
		<header>헤더</header>
		<article id ="content">
			<div class="content-header" data-cms-content="/health/_content/title"><!-- 뭔지 모르겠음 -->
				<h2 class="content-title">
					<div>신체부위별 찾기</div>
				</h2>
			</div>
			<div class="content-body cms-search cms-print" id="cms-content">
				<div class="box-guide d-down-md">
					<p>증상을 보이는 신체부위를 선택하세요</p>
				</div>
				<div class="body-search">
					<div id="body-image" class="body-imaege">
						<button class="ghost-button">.</button>
						<button id="head" class="ghost-button" onclick="loadNewButton()">머리</button>
						<div id="buttonContainer-head" class="add-Hbutton">
						    <!-- 새로운 버튼이 여기에 추가됩니다. -->
						</div>
							<script>
							document.getElementById("head").addEventListener("click", function createNewButton() {
							    // Create a new button element.
							    var newHButton = document.createElement("button");
							    var newHButton2 = document.createElement("button");
							    var newHButton3 = document.createElement("button");
							    var newHButton4 = document.createElement("button");
							    var newHButton5 = document.createElement("button");
							    
							    newHButton.className = "new-Hbutton";
							    newHButton2.className = "new-Hbutton2";
							    newHButton3.className = "new-Hbutton3";
							    newHButton4.className = "new-Hbutton4";
							    newHButton5.className = "new-Hbutton5";
							    
							
							    // Set the button's text.
							    newHButton.innerHTML = "두통";
							    newHButton2.innerHTML = "어지럼증";
							    newHButton3.innerHTML = "얼굴떨림";
							    newHButton4.innerHTML = "편두통";
							    newHButton5.innerHTML = "손떨림";
							
							    // You can add a class or other properties to the new button as needed.
							    // newButton.className = "custom-button";
							    // newButton.setAttribute("data-action", "something");
							
							    // You can add an event listener to the new button if needed.
							    // newButton.addEventListener("click", function() {
							    //     // Write the logic that operates when the button is clicked.
							    // });
							
							    // Add the new button to the button container.
							    document.getElementById("buttonContainer-head").appendChild(newHButton);
							    document.getElementById("buttonContainer-head").appendChild(newHButton2);
							    document.getElementById("buttonContainer-head").appendChild(newHButton3);
							    document.getElementById("buttonContainer-head").appendChild(newHButton4);
							    document.getElementById("buttonContainer-head").appendChild(newHButton5);
							    
							
							    // Remove the event listener so the button is only created once.
							    document.getElementById("head").removeEventListener("click", createNewButton);
							});
							</script>					

												
						<button class="ghost-button2">.</button>
						<button class="ghost-button2">.</button>
						<button class="ghost-button2">.</button>
						<button class="ghost-button2">.</button>
						<button class="ghost-button2">.</button>																	
						<button id="chest" class="ghost-button2" onclick="loadNewButton()">가슴</button>
						<div id="buttonContainer-chest" class="add-Hbutton">
						    <!-- 새로운 버튼이 여기에 추가됩니다. -->
						</div>
							<script>
							document.getElementById("chest").addEventListener("click", function createNewButton() {
							    // Create a new button element.
							    var newCButton = document.createElement("button");
							    var newCButton2 = document.createElement("button");
							    var newCButton3 = document.createElement("button");
							    var newCButton4 = document.createElement("button");
							    var newCButton5 = document.createElement("button");
							    
							    newCButton.className = "new-Cbutton";
							    newCButton2.className = "new-Cbutton2";
							    newCButton3.className = "new-Cbutton3";
							    newCButton4.className = "new-Cbutton4";
							    newCButton5.className = "new-Cbutton5";
							    
							
							    // Set the button's text.
							    newCButton.innerHTML = "객혈";
							    newCButton2.innerHTML = "호흡곤란";
							    newCButton3.innerHTML = "흉통";
							    newCButton4.innerHTML = "기침";
							    newCButton5.innerHTML = "가슴쓰림";
							
							    // You can add a class or other properties to the new button as needed.
							    // newButton.className = "custom-button";
							    // newButton.setAttribute("data-action", "something");
							
							    // You can add an event listener to the new button if needed.
							    // newButton.addEventListener("click", function() {
							    //     // Write the logic that operates when the button is clicked.
							    // });
							
							    // Add the new button to the button container.
							    document.getElementById("buttonContainer-head").appendChild(newCButton);
							    document.getElementById("buttonContainer-head").appendChild(newCButton2);
							    document.getElementById("buttonContainer-head").appendChild(newCButton3);
							    document.getElementById("buttonContainer-head").appendChild(newCButton4);
							    document.getElementById("buttonContainer-head").appendChild(newCButton5);
							    
							
							    // Remove the event listener so the button is only created once.
							    document.getElementById("chest").removeEventListener("click", createNewButton);
							});
							</script>
						
						<button class="ghost-button3">.</button>
						<button class="ghost-button3">.</button>
						<button class="ghost-button3">.</button>																								
						<button class="ghost-button3">.</button>
						<button id="neck" class="ghost-button3" onclick="loadNewButton()">목</button>
						<div id="buttonContainer-neck" class="add-Hbutton">
						    <!-- 새로운 버튼이 여기에 추가됩니다. -->
						</div>
							<script>
							document.getElementById("neck").addEventListener("click", function createNewButton() {
							    // Create a new button element.
							    var newNButton = document.createElement("button");
							    var newNButton2 = document.createElement("button");
							    
							    newNButton.className = "new-Hbutton";
							    newNButton2.className = "new-Hbutton2";
							    
							
							    // Set the button's text.
							    newNButton.innerHTML = "목통증";
							    newNButton2.innerHTML = "가래";
							
							    // You can add a class or other properties to the new button as needed.
							    // newButton.className = "custom-button";
							    // newButton.setAttribute("data-action", "something");
							
							    // You can add an event listener to the new button if needed.
							    // newButton.addEventListener("click", function() {
							    //     // Write the logic that operates when the button is clicked.
							    // });
							
							    // Add the new button to the button container.
							    document.getElementById("buttonContainer-neck").appendChild(newNButton);
							    document.getElementById("buttonContainer-neck").appendChild(newNButton2);
							    
							
							    // Remove the event listener so the button is only created once.
							    document.getElementById("neck").removeEventListener("click", createNewButton);
							});
							</script>	
						
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button id="abdomen" class="ghost-button4" onclick="loadNewButton()">복부</button>
						<div id="buttonContainer-abdomen" class="add-Hbutton">
						    <!-- 새로운 버튼이 여기에 추가됩니다. -->
						</div>
							<script>
							document.getElementById("abdomen").addEventListener("click", function createNewButton() {
							    // Create a new button element.
							    var newAButton = document.createElement("button");
							    var newAButton2 = document.createElement("button");
							    var newAButton3 = document.createElement("button");
							    var newAButton4 = document.createElement("button");
							    var newAButton5 = document.createElement("button");
							    
							    newAButton.className = "new-Abutton";
							    newAButton2.className = "new-Abutton2";
							    newAButton3.className = "new-Abutton3";
							    newAButton4.className = "new-Abutton4";
							    newAButton5.className = "new-Abutton5";
							    
							
							    // Set the button's text.
							    newAButton.innerHTML = "구토";
							    newAButton2.innerHTML = "복통";
							    newAButton3.innerHTML = "설사";
							    newAButton4.innerHTML = "변비";
							    newAButton5.innerHTML = "속쓰림";
							
							    // You can add a class or other properties to the new button as needed.
							    // newButton.className = "custom-button";
							    // newButton.setAttribute("data-action", "something");
							
							    // You can add an event listener to the new button if needed.
							    // newButton.addEventListener("click", function() {
							    //     // Write the logic that operates when the button is clicked.
							    // });
							
							    // Add the new button to the button container.
							    document.getElementById("buttonContainer-abdomen").appendChild(newAButton);
							    document.getElementById("buttonContainer-abdomen").appendChild(newAButton2);
							    document.getElementById("buttonContainer-abdomen").appendChild(newAButton3);
							    document.getElementById("buttonContainer-abdomen").appendChild(newAButton4);
							    document.getElementById("buttonContainer-abdomen").appendChild(newAButton5);
							    
							
							    // Remove the event listener so the button is only created once.
							    document.getElementById("abdomen").removeEventListener("click", createNewButton);
							});
							</script>
						
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button id="Urology" class="ghost-button5" onclick="loadNewButton()">비뇨기</button>
						<div id="buttonContainer-Urology" class="add-Hbutton">
						    <!-- 새로운 버튼이 여기에 추가됩니다. -->
						</div>
							<script>
							document.getElementById("Urology").addEventListener("click", function createNewButton() {
							    // Create a new button element.
							    var newUButton = document.createElement("button");
							    var newUButton2 = document.createElement("button");
							    var newUButton3 = document.createElement("button");
							    
							    newUButton.className = "new-Ubutton";
							    newUButton2.className = "new-Ubutton2";
							    newUButton3.className = "new-Ubutton3";
							    
							
							    // Set the button's text.
							    newUButton.innerHTML = "통증";
							    newUButton2.innerHTML = "혈뇨";
							    newUButton3.innerHTML = "요실금";
							
							    // You can add a class or other properties to the new button as needed.
							    // newButton.className = "custom-button";
							    // newButton.setAttribute("data-action", "something");
							
							    // You can add an event listener to the new button if needed.
							    // newButton.addEventListener("click", function() {
							    //     // Write the logic that operates when the button is clicked.
							    // });
							
							    // Add the new button to the button container.
							    document.getElementById("buttonContainer-Urology").appendChild(newUButton);
							    document.getElementById("buttonContainer-Urology").appendChild(newUButton2);
							    document.getElementById("buttonContainer-Urology").appendChild(newUButton3);
							    
							
							    // Remove the event listener so the button is only created once.
							    document.getElementById("Urology").removeEventListener("click", createNewButton);
							});
							</script>
						
						<button class="ghost-button6">.</button>
						<button class="ghost-button6">.</button>
						<button class="ghost-button6">.</button>
						<button class="ghost-button6">.</button>
						<button class="ghost-button6">.</button>
						<button class="ghost-button6">.</button>
						<button class="ghost-button6">.</button>
						<button class="ghost-button6">.</button>
						<button id="armHandButton" class="ghost-button6" onclick="loadNewButton()">팔/손</button>
						<div id="buttonContainer" class="add-button">
						    <!-- 새로운 버튼이 여기에 추가됩니다. -->
						</div>
						
						    <script>
						        document.getElementById("armHandButton").addEventListener("click", function createNewButton() {
						            // 새로운 버튼 요소를 생성합니다.
						            var newButton = document.createElement("button");
						            var newButton2 = document.createElement("button");
						            newButton.className = "new-button";
						            newButton2.className = "new-button2";
						            
						            // 버튼의 텍스트를 설정합니다.
						            newButton.innerHTML = "새로운 버튼";
									newButton2.innerHTML ="새로우 버튼2"
						            // 필요에 따라 새로운 버튼에 클래스나 다른 속성을 추가할 수 있습니다.
						            // newButton.className = "custom-button";
						            // newButton.setAttribute("data-action", "something");
						
						            // 필요한 경우 새로운 버튼에 이벤트 리스너를 추가할 수 있습니다.
						            // newButton.addEventListener("click", function() {
						            //     // 버튼 클릭 시 동작하는 로직을 작성합니다.
						            // });
						
						            // 새로운 버튼을 버튼 컨테이너에 추가합니다.
						            document.getElementById("buttonContainer").appendChild(newButton);
						            document.getElementById("buttonContainer").appendChild(newButton2);
						
						            // 이벤트 리스너를 제거하여 버튼이 한 번만 생성되도록 합니다.
						            document.getElementById("armHandButton").removeEventListener("click", createNewButton);
						        });
						    </script>
						
						<button class="ghost-button7">.</button>
						<button class="ghost-button7">.</button>
						<button class="ghost-button7">.</button>
						<button class="ghost-button7">.</button>
						<button class="ghost-button7">.</button>
						<button class="ghost-button7">.</button>
						<button class="ghost-button7">.</button>
						<button class="ghost-button7">.</button>
						<button id="armHandButton" class="ghost-button7" onclick="loadNewButton()">팔/손</button>
						
						<button class="ghost-button8">.</button>
						<button class="ghost-button8">.</button>
						<button class="ghost-button8">.</button>
						<button class="ghost-button8">.</button>
						<button class="ghost-button8">.</button>
						<button class="ghost-button8">.</button>
						<button class="ghost-button8">.</button>
						<button class="ghost-button8">.</button>
						<button id="armHandButton" class="ghost-button8" onclick="loadNewButton()">팔/손</button>
						
						<button class="ghost-button9">.</button>
						<button class="ghost-button9">.</button>
						<button class="ghost-button9">.</button>
						<button class="ghost-button9">.</button>
						<button class="ghost-button9">.</button>
						<button class="ghost-button9">.</button>
						<button class="ghost-button9">.</button>
						<button class="ghost-button9">.</button>
						<button id="armHandButton" class="ghost-button9" onclick="loadNewButton()">팔/손</button>
						
						<button class="ghost-button10">.</button>
						<button class="ghost-button10">.</button>
						<button class="ghost-button10">.</button>
						<button class="ghost-button10">.</button>
						<button class="ghost-button10">.</button>
						<button class="ghost-button10">.</button>
						<button class="ghost-button10">.</button>
						<button class="ghost-button10">.</button>
						<button class="ghost-button10">.</button>
						<button class="ghost-button10">다리/발</button>
						
						<button class="ghost-button11">.</button>
						<button class="ghost-button11">.</button>
						<button class="ghost-button11">.</button>
						<button class="ghost-button11">.</button>
						<button class="ghost-button11">.</button>
						<button class="ghost-button11">.</button>
						<button class="ghost-button11">.</button>
						<button class="ghost-button11">.</button>
						<button class="ghost-button11">.</button>
						<button class="ghost-button11">다리/발</button>
						
						<button class="ghost-button12">.</button>
						<button class="ghost-button12">.</button>
						<button class="ghost-button12">.</button>
						<button class="ghost-button12">.</button>
						<button class="ghost-button12">.</button>
						<button class="ghost-button12">.</button>
						<button class="ghost-button12">.</button>
						<button class="ghost-button12">.</button>
						<button class="ghost-button12">.</button>
						<button class="ghost-button12">다리/발</button>

						<button class="ghost-button13">.</button>
						<button class="ghost-button13">.</button>
						<button class="ghost-button13">.</button>
						<button class="ghost-button13">.</button>
						<button class="ghost-button13">.</button>
						<button class="ghost-button13">.</button>
						<button class="ghost-button13">.</button>
						<button class="ghost-button13">.</button>
						<button class="ghost-button13">.</button>
						<button class="ghost-button13">다리/발</button>
						
						<button class="ghost-button14"></button>
						<button class="ghost-button14"></button>
						<button class="ghost-button14"></button>
						<button id="face" class="ghost-button14" onclick="loadNewButton()">얼굴</button>
						<div id="buttonContainer-face" class="add-Hbutton">
						    <!-- 새로운 버튼이 여기에 추가됩니다. -->
						</div>
							<script>
							document.getElementById("face").addEventListener("click", function createNewButton() {
							    // Create a new button element.
							    var newFButton = document.createElement("button");
							    var newFButton2 = document.createElement("button");
							    var newFButton3 = document.createElement("button");
							    var newFButton4 = document.createElement("button");
							    var newFButton5 = document.createElement("button");
							    var newFButton6 = document.createElement("button");
							    var newFButton7 = document.createElement("button");
							    var newFButton8 = document.createElement("button");
							    var newFButton9 = document.createElement("button");
							    var newFButton10 = document.createElement("button");
							    
							    newFButton.className = "new-Fbutton";
							    newFButton2.className = "new-Fbutton2";
							    newFButton3.className = "new-Fbutton3";
							    newFButton4.className = "new-Fbutton4";
							    newFButton5.className = "new-Fbutton5";
							    newFButton6.className = "new-Fbutton6";
							    newFButton7.className = "new-Fbutton7";
							    newFButton8.className = "new-Fbutton8";
							    newFButton9.className = "new-Fbutton9";
							    newFButton10.className = "new-Fbutton10";
							    
							    
							
							    // Set the button's text.
							    newFButton.innerHTML = "눈충혈";
							    newFButton2.innerHTML = "저시력";
							    newFButton3.innerHTML = "눈간지럼증";
							    newFButton4.innerHTML = "귀통증";
							    newFButton5.innerHTML = "이명";
							    newFButton6.innerHTML = "난청";
							    newFButton7.innerHTML = "이통증";
							    newFButton8.innerHTML = "이시림";
							    newFButton9.innerHTML = "잇몸출혈";
							    newFButton10.innerHTML = "코막힘";
							
							    // You can add a class or other properties to the new button as needed.
							    // newButton.className = "custom-button";
							    // newButton.setAttribute("data-action", "something");
							
							    // You can add an event listener to the new button if needed.
							    // newButton.addEventListener("click", function() {
							    //     // Write the logic that operates when the button is clicked.
							    // });
							
							    // Add the new button to the button container.
							    document.getElementById("buttonContainer-face").appendChild(newFButton);
							    document.getElementById("buttonContainer-face").appendChild(newFButton2);
							    document.getElementById("buttonContainer-face").appendChild(newFButton3);
							    document.getElementById("buttonContainer-face").appendChild(newFButton4);
							    document.getElementById("buttonContainer-face").appendChild(newFButton5);
							    document.getElementById("buttonContainer-face").appendChild(newFButton6);
							    document.getElementById("buttonContainer-face").appendChild(newFButton7);
							    document.getElementById("buttonContainer-face").appendChild(newFButton8);
							    document.getElementById("buttonContainer-face").appendChild(newFButton9);
							    document.getElementById("buttonContainer-face").appendChild(newFButton10);
							    
							    
							
							    // Remove the event listener so the button is only created once.
							    document.getElementById("head").removeEventListener("click", createNewButton);
							});
							</script>							
																																																																																						
						
					</div>
					
										
      
			        	<form action="#" class="body-menu">
			        		<fieldset>
			        			<legend class="d-up-lg">증상을 보이는 신체부위를 선택하세요</legend>
			        			<ul class="body-list">
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" checked value="on">
				        					<span class="label">전신</span>
			        					</label>
			        				</li>
			
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody">
				        					<span class="label">머리</span>
			        					</label>
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody">
			        						<span class="label">정신</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody">
				        					<span class="label">얼굴</span>
			        					</label>
			        				</li>
			        				
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody">
				        					<span class="label">목</span>
				        				</label>	
			        				</li> 
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody">
			        						<span class="label">가슴/등</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody">
				        					<span class="label">복부</span>
				        				</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody">
			        						<span class="label">생식/비뇨기</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody">
			        						<span class="label">팔과 손</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody">
			        						<span class="label">다리와 발</span>
			        					</label>
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody">
			        						<span class="label">뼈/근육</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody">
			        						<span class="label">피부</span>
			        					</label>
			        				</li>			        				        				        				        				        				        				        				        				       				        				        				        				
			        			</ul>
			        		</fieldset>       	
        				</form> 
					</div>
				</div>            
		</article>
	</div>
</body>
</html>