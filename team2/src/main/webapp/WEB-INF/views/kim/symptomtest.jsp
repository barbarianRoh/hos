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
									var hos3 = 'http://localhost:8080/hos/choo/resultHos';
									var hos4 = 'http://localhost:8080/hos/choo/resultHos';
									var hos5 = 'http://localhost:8080/hos/choo/resultHos';
									var hos6 = 'http://localhost:8080/hos/choo/resultHos';
									var hos7 = 'http://localhost:8080/hos/choo/resultHos';
									var hos8 = 'http://localhost:8080/hos/choo/resultHos';
									var hos9 = 'http://localhost:8080/hos/choo/resultHos';
									var hos10 = 'http://localhost:8080/hos/choo/resultHos';
									var hos11 = 'http://localhost:8080/hos/choo/resultHos';
									var W0 = W0;
									var W1 = W1;
									var Q0 = Q0;
									var Q1 = Q1;
							        if (buttonType === 'Urology') {
							            containerId = 'buttonContainer-Urology';
							            newButtonClassName = 'new-Ubutton';
							            newButtonData = [
							                { label: '통증', link: '통증 관련 링크' },
							                { label: '혈뇨', link: '혈뇨 관련 링크' },
							                { label: '요실금', link: '요실금 관련 링크' },
							            ];

							            clearContainers(['buttonContainer-head', 'buttonContainer-abdomen', 'buttonContainer-face', 'buttonContainer-chest', 'buttonContainer-neck']);

							            // 새로운 버튼들을 생성하고 이벤트 리스너를 추가합니다.
							            let container = document.getElementById(containerId);
							            while (container.firstChild){
							            	container.removeChild(container.firstChild);
							            }
							            
							            newButtonData.forEach((data)=>{
							            	let newButton = document.createElement('a');
							            	newButton.className = newButtonClassName;
							            	newButton.innerHTML = data.label;
							            	newButton.href = data.link;
							            	newButton.target = '_blank';// 새창에서 열기
							            	container.appendChile(newButton);
							            	
							            	newButton.addEventListener('click',function(){
							                    if (buttonType === 'head' || buttonType === 'abdomen' || buttonType === 'face' || buttonType === 'Urology' || buttonType === 'chest' || buttonType === 'neck') {
							                        toggleButton(buttonType);
							                    }else{}
							            	});
							            });
	
							
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
							                { label: '두통', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('머리') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('두통')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구') },
							                { label: '어지러움', link: hos2 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('머리') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('어지러움')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구') },
							                { label: '편두통', link: hos4 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('머리') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('편두통')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '손떨림', link: hos5 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('머리') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('손떨림')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')}
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
							                { label: '구토', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('배') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('구역질/구토') + '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '복통', link: hos2 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('배') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('복통')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '설사', link: hos3 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('배') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('설사')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '변비', link: hos4 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('배') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('변비')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '속쓰림', link: hos5 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('배') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('속쓰림')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')}
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
							                { label: '눈 충혈', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('눈충혈')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '저시력', link: hos6 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('저시력')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '눈 가지럼', link: hos2 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('눈간지럼') + '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '귀 통증', link: hos3 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('귀통증') + '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '이명', link: hos4 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이명') + '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '난청', link: hos5 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('난청')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구') },
							                { label: '이 통증', link: hos7 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이통증')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '이 시림', link: hos8 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이시림')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '잇몸 출혈', link: hos9 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('잇몸출혈')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '코 막힘', link: hos10 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('코막힘')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '얼굴 떨림', link: hos11 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('얼굴떨림')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')}
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
							                { label: '객혈', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('객혈')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '호흡곤란', link: hos2 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('호흡곤란')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '흉통', link: hos3 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('흉통')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '기침', link: hos4 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('기침')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '가슴쓰림', link: hos5 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('가슴쓰림')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')}
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
							                { label: '목 통증', link: hos1 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('목') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('목 통증') + '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')},
							                { label: '가래', link: hos2 += '?' + encodeURIComponent('W0') + '=' + encodeURIComponent('목') + '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('가래')+ '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent('서울') + '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent('관악구')}
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
							    
							    document.body.addEventListener('click',function(event){
							    	if(event.target.classList.contains('new-Hbuton')){
							    		let symptomName = event.target.innerText;
							    		updateSymptomCount(symptomName)
							    	}
							    })
							    
							    function updateSymptomCount(symptomName){
							    	featch('/updateSymptomCount?symptomName='+ encodeURIComponent(symptomName))
							    		.then(response =>{
							    			if(response.ok){
							    				
							    			}else{
							    				
							    			}
							    		})
							    		.catch(error =>{
							    			
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
					        			$(function() {
					        				  var urlTable = [
					        				    "https://www.naver.com",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D003&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D004&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D001&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D001&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D001&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D001&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D014&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D008&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D008&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D016&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    "http://localhost:8080/hos/choo/hosapiresult?selectOption=D001&hosType=&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B4%80%EC%95%85%EA%B5%AC&QD=D001&QZ=",
					        				    //링크 변경 시키기
					        				  ];
	
					        				  var selectedUrl = urlTable[0];
	
					        				  $(".body_type").click(function() {
					        				    var selectedIndex = $(".body_type").index(this);
					        				    selectedUrl = urlTable[selectedIndex];
					        				  });
	
					        				  $(".btn_search").click(function() {
					        				    window.open(selectedUrl, "_blank");
					        				  });
					        				});

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