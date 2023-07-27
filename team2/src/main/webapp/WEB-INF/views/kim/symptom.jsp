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
					<div id="body-image" class="body-imaege"style="
						margin-left: 100px;
						margin-right: 100px;
						
					">
						<button class="ghost-button">.</button>
						<button id="head" class="ghost-button" onclick="createNewButton('head')">머리</button>

							<script>
							    let headButtonClicked = false;
							    let abdomenButtonClicked = false;
							    let faceButtonClicked = false;
							    let urologyButtonClicked = false;
								
							    
							    function applyCustomStyleToButton(newButton) {
							        // 여기에 새로운 버튼에 원하는 스타일을 적용하는 코드를 작성합니다.
							        newButton.style.backgroundColor = '#4CAF50'; // 녹색 배경색
							        newButton.style.border = 'none'; // 테두리 없음
							        newButton.style.color = 'white'; // 흰색 텍스트 색상
							        newButton.style.padding = '10px 20px'; // 패딩 추가
							        newButton.style.textAlign = 'center'; // 가운데 정렬
							        newButton.style.textDecoration = 'none'; // 밑줄 제거
							        newButton.style.display = 'inline-block'; // 블록 요소로 표시
							        newButton.style.margin = '4px 2px'; // 마진 추가
							        newButton.style.cursor = 'pointer'; // 커서를 포인터로 변경하여 호버 효과 생성
							        newButton.style.borderRadius = '4px'; // 둥근 모서리

							        // 버튼 호버 효과
							        newButton.addEventListener('mouseover', function () {
							            newButton.style.backgroundColor = '#45a049'; // 호버 시 어두운 녹색 배경색
							        });

							        newButton.addEventListener('mouseout', function () {
							            newButton.style.backgroundColor = '#4CAF50'; // 호버 해제 시 다시 원래 배경색으로
							        });
							    }
							    
							    function toggleButton(buttonType) {
							        if (buttonType === 'Urology' && !urologyButtonClicked) {
							            createNewButton('Urology');
							            urologyButtonClicked = true;
							        } else if (buttonType === 'head' && !headButtonClicked) {
							            createNewButton('head');
							            headButtonClicked = true;
							        } else if (buttonType === 'abdomen' && !abdomenButtonClicked) {
							            createNewButton('abdomen');
							            abdomenButtonClicked = true;
							        } else if (buttonType === 'face' && !faceButtonClicked) {
							            createNewButton('face');
							            faceButtonClicked = true;
							        } else if (buttonType === 'chest' && !chestButtonClicked) {
							            createNewButton('chest');
							            chestButtonClicked = true;
							        }  else if (buttonType === 'neck' && !neckButtonClicked) {
							            createNewButton('neck');
							            neckButtonClicked = true;
							        }  else {
							            // Remove event listeners for all buttons
							            document.getElementById('Urology').removeEventListener('click', function () {
							                toggleButton('Urology');
							            });
							            document.getElementById('head').removeEventListener('click', function () {
							                toggleButton('head');
							            });
							            document.getElementById('abdomen').removeEventListener('click', function () {
							                toggleButton('abdomen');
							            });
							            document.getElementById('face').removeEventListener('click', function () {
							                toggleButton('face');
							            });
							            document.getElementById('chest').removeEventListener('click', function () {
							                toggleButton('chest');
							            });
							            document.getElementById('neck').removeEventListener('click', function () {
							                toggleButton('neck');
							            });							            
							        }
							    }
							
							    function createNewButton(buttonType) {
							        let containerId;
							        let newButtonClassName;
							        let newButtonData = [];
									var hos1 = 'http://localhost:8080/hos/choo/resultHos';
									var hos2 = 'http://localhost:8080/hos/choo/resultHos';
							        if (buttonType === 'Urology') {
							            containerId = 'buttonContainer-Urology';
							            newButtonClassName = 'new-Ubutton';
							            newButtonData = [
							                { label: '통증', link: 'https://www.naver.com' },
							                { label: '혈뇨', link: 'https://www.google.com' },
							                { label: '요실금', link: '/hos/kim/chatForm' }
							            ];
							
							            clearContainers(['buttonContainer-head', 'buttonContainer-abdomen', 'buttonContainer-face','buttonContainer-chest','buttonContainer-neck']);
							            headButtonClicked = false;
							            abdomenButtonClicked = false;
							            faceButtonClicked = false;
							            chestButtonClicked = false;
							            neckButtonClicked = false;							            
							        } else if (buttonType === 'head') {
							            containerId = 'buttonContainer-head';
							            newButtonClassName = 'new-Hbutton';
							            newButtonData = [
							                { label: '두통', link: 'https://www.example.com/headache' },
							                { label: '어지러움', link: 'https://www.example.com/dizziness' },
							                { label: '얼굴떨림', link: 'https://www.example.com/shake-face' },
							                { label: '편두통', link: 'https://www.example.com/migraine' },
							                { label: '손떨림', link: 'https://www.example.com/hand-shake' }
							            ];
							
							            clearContainers(['buttonContainer-Urology', 'buttonContainer-abdomen', 'buttonContainer-face','buttonContainer-chest','buttonContainer-neck']);
							            urologyButtonClicked = false;
							            abdomenButtonClicked = false;
							            faceButtonClicked = false;
							            chestButtonClicked = false;
							            neckButtonClicked = false;							            
							        } else if (buttonType === 'abdomen') {
							            containerId = 'buttonContainer-abdomen';
							            newButtonClassName = 'new-Abutton';
							            newButtonData = [
							                { label: '구토', link: 'https://www.example.com/headache' },
							                { label: '복통', link: 'https://www.example.com/dizziness' },
							                { label: '설사', link: 'https://www.example.com/shake-face' },
							                { label: '변비', link: 'https://www.example.com/migraine' },
							                { label: '속쓰림', link: 'https://www.example.com/hand-shake' }
							            ];
							
							            clearContainers(['buttonContainer-Urology', 'buttonContainer-head', 'buttonContainer-face','buttonContainer-chest','buttonContainer-neck']);
							            urologyButtonClicked = false;
							            headButtonClicked = false;
							            faceButtonClicked = false;
							            chestButtonClicked = false;
							            neckButtonClicked = false;							            
							        } else if (buttonType === 'face') {
							            containerId = 'buttonContainer-face';
							            newButtonClassName = 'new-Fbutton';
							            newButtonData = [
							                { label: '눈 충혈', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('눈충혈')},
							                { label: '저시력', link: 'https://www.example.com/dizziness' },
							                { label: '눈 가지럼', link: hos2 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('눈간지럼') },
							                { label: '귀 통증', link: hos2 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('귀통증') },
							                { label: '이명', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이명') },
							                { label: '난청', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('난청') },
							                { label: '이 통증', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이통증')},
							                { label: '이 시림', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이시림')},
							                { label: '잇몸 출혈', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('잇몸출혈')},
							                { label: '코 막힘', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('코막힘')}
							            ];
							
							            clearContainers(['buttonContainer-Urology', 'buttonContainer-head', 'buttonContainer-abdomen','buttonContainer-chest','buttonContainer-neck']);
							            urologyButtonClicked = false;
							            headButtonClicked = false;
							            abdomenButtonClicked = false;
							            chestButtonClicked = false;
							            neckButtonClicked = false;
							        } else if (buttonType === 'chest') {
							            containerId = 'buttonContainer-chest';
							            newButtonClassName = 'new-Cbutton';
							            newButtonData = [
							                { label: '객혈', link: 'https://www.example.com/headache' },
							                { label: '호흡곤란', link: 'https://www.example.com/dizziness' },
							                { label: '흉통', link: 'https://www.example.com/shake-face' },
							                { label: '기침', link: 'https://www.example.com/migraine' },
							                { label: '가슴쓰림', link: 'https://www.example.com/hand-shake' }
							            ];
							
							            clearContainers(['buttonContainer-Urology', 'buttonContainer-head', 'buttonContainer-abdomen','buttonContainer-neck','buttonContainer-face']);
							            urologyButtonClicked = false;
							            headButtonClicked = false;
							            abdomenButtonClicked = false;
							            neckButtonClicked = false;
							            faceButtonClicked = false;
							        } else if (buttonType === 'neck') {
							            containerId = 'buttonContainer-neck';
							            newButtonClassName = 'new-Nbutton';
							            newButtonData = [
							                { label: '목 통증', link: 'https://www.example.com/headache' },
							                { label: '가래', link: 'https://www.example.com/dizziness' }
							            ];
							
							            clearContainers(['buttonContainer-Urology', 'buttonContainer-head', 'buttonContainer-abdomen','buttonContainer-face','buttonContainer-chest']);
							            urologyButtonClicked = false;
							            headButtonClicked = false;
							            abdomenButtonClicked = false;
							            faceButtonClicked = false;
							            chestButtonClicked = false;
							        }
							
							        let container = document.getElementById(containerId);
							        newButtonData.forEach((data) => {
							            let newButton = document.createElement('a');
							            newButton.className = newButtonClassName;
							            newButton.innerHTML = data.label;
							            newButton.href = data.link;
							            newButton.target = '_blank'; // 새 창에서 링크 열기
							            container.appendChild(newButton);
							        });
							    }
							
							    // 각 섹션 버튼에 대한 이벤트 리스너
							    document.getElementById('head').addEventListener('click', function () {
							        toggleButton('head');
							    });
							
							    document.getElementById('abdomen').addEventListener('click', function () {
							        toggleButton('abdomen');
							    });
							
							    document.getElementById('face').addEventListener('click', function () {
							        toggleButton('face');
							    });
							
							    document.getElementById('Urology').addEventListener('click', function () {
							        toggleButton('Urology');
							    });
							    
							    document.getElementById('chest').addEventListener('click', function () {
							        toggleButton('chest');
							    });
							    
							    document.getElementById('neck').addEventListener('click', function () {
							        toggleButton('neck');
							    });
							
							    function clearContainers(containerIds) {
							        containerIds.forEach((id) => {
							            let container = document.getElementById(id);
							            while (container.firstChild) {
							                container.removeChild(container.firstChild);
							            }
							        });
							    }
							</script>
												
						<button class="ghost-button2">.</button>
						<button class="ghost-button2">.</button>
						<button class="ghost-button2">.</button>
						<button class="ghost-button2">.</button>
						<button class="ghost-button2">.</button>																	
						<button id="chest" class="ghost-button2" onclick="createNewButton('chest')">가슴</button>

						
						<button class="ghost-button3">.</button>
						<button class="ghost-button3">.</button>
						<button class="ghost-button3">.</button>																								
						<button class="ghost-button3">.</button>
						<button id="neck" class="ghost-button3" onclick="createNewButton('neck')">목</button>
						
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button id="abdomen" class="ghost-button4" onclick="createNewButton('abdomen')">복부</button>

						
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button id="Urology" class="ghost-button5" onclick="createNewButton('Urology')">비뇨기</button>

						
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
						            var newButton = document.createElement("button");
						            var newButton2 = document.createElement("button");
						            newButton.className = "new-button";
						            newButton2.className = "new-button2";
						            
						            newButton.innerHTML = "새로운 버튼";
									newButton2.innerHTML ="새로우 버튼2"
						            
									document.getElementById("buttonContainer").appendChild(newButton);
						            document.getElementById("buttonContainer").appendChild(newButton2);
						
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
						<button id="face" class="ghost-button14" onclick="createNewButton('face')">얼굴</button>
						
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
			        			<div class="btn-area">
			        				<button class="btn_search btn btn-lg btn-round btn-primary" type="button">검색</button>
				        			<script>
										$(function(){
											$(".btn_search").click(function(){
												//var codeTable = [53,54,55,56,57,58,59,60,61,62,63,64];
												var codeTable = [279,280,281,282,283,284,285,286,287,288,289,290];
												var category = codeTable[0];
												$(".body_type").each(function(index, item){
													if(item.checked) {
														category = codeTable[index];
													}
												}
																	);
												window.open("/health/encyclopedia/disease/body_board.do?srBodyCategoryId=" + category + "&mode=list&srSearchKey=&srSearchVal=","_blank");
											}
																  );
										}
										 );
				        			</script>
			        			</div>			        			
			        		</fieldset>       	
        				</form> 
        				</div>
					</div>
				</div>            
		</article>
	</div>
	<div id="buttonContainer-head" class="add-Hbutton"></div>
	<div id="buttonContainer-face" class="add-Fbutton"></div>
	<div id="buttonContainer-neck" class="add-Nbutton"></div>	
	<div id="buttonContainer-Urology" class="add-Ubutton"></div>		
	<div id="buttonContainer-abdomen" class="add-Hbutton"></div>
	<div id="buttonContainer-chest" class="add-Cbutton"></div>
	
</body>
</html>