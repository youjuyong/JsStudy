<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--%@ page session="false" %>-->
<html>
<head>
	<title>Home</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.democlass {
	color : red;
}
</style>
<script>
$(document).ready(function(){
		// 버튼을 클릭해서 css 변경
		let btnValue = document.getElementById('btn');
		btnValue.addEventListener('click', function() {
			let color = document.getElementById('demo').style.color;
			if(color === 'red') document.getElementById('demo').style.color = 'black';
			else document.getElementById('demo').style.color = 'red'
		});
		
		// 버튼을 클릭해서 요소 보이기, 숨김기능 
		let btnDisplay = document.getElementById('btnDisplay');
		btnDisplay.addEventListener('click', function () {
			
			let displayChk = document.getElementById('demo').style.display;
			if(displayChk ===  null || displayChk === '') document.getElementById('demo').style.display = 'none';
			else document.getElementById('demo').style.display = '';
				
		});
		
		// 버튼 클릭시 Text 변경
		let btnChangeValue = document.getElementById('btnChangeValue');
		btnChangeValue.addEventListener('click', function () {
			document.getElementById('demo').innerHTML = '텍스트 변경';
		});
		
		// div생성후 body에 append
		const parent = document.createElement('div');
		document.body.prepend(parent);
		parent.prepend('append 예시');
		
		let result = "날씨가 화창합니다.";
			result += "이런날씨 없죠";
		parent.prepend(result);
		
		// html 요소 찾기
		// document.getElementById : id값에 명시된 값을 찾기 
		// documetn.getElementsByTagName : name으로 명시된 요소 찾기
		// document.getElementsByclassName : class 이름에 의한 요소 찾기
		
		let pTagName = document.getElementsByTagName("p");
		document.getElementById("demo1").innerHTML = "2번째 p 태그 Text 변경 " + pTagName[2].innerHTML;
		
		// getElementsByclassName 으로 class가 pClass인 요소를 접근
		let classTest = document.getElementsByClassName("pClass");
		document.getElementById("classNameTest").innerHTML = "pclass 테스트" + classTest[1].innerHTML;
		
		// 자바 스크립트는 Object colloection을 form[], anchors[], layers[], images[]가 있다.
		// 이들은 문서내에 여러개가 존재하면 마치 배열처럼 각 객체에 접근한다.
		// id하나의 form collection에 접근해 내부 각 요소는 elements[index]에 의해 접근한다.
		
		let formBtn = document.getElementById("collectionBtn");
		formBtn.addEventListener('click',	function () {
			let x = document.getElementById("frm1");
			let text = '';
			for(let z = 0; z < x.length; z++){
				text += x.elements[z].value +"<br>";
			}
			document.getElementById("demo3").innerHTML = text;
		});
		
		// element.innerHTML = new html  : content HTML 요소의 내용을 변경한다.
		// element.attribute = new value : HTML 요소의 속성 값을 변경한다.
		// element.setAttribute = HTML 요소의 속성 값을 변경한다.
		// element.style.property = HTML 요소의 스타일을 변경한다.
		
		let attributeChange = document.getElementById("changeAttribute");
		attributeChange.addEventListener('click', function () {
			document.getElementsByTagName("h1")[0].setAttribute("class","democlass");
		});
		
		// document.createElement(element) : HTML 요소 생성
		// document.removeChild(element)   : HTML 요소 제거
		// document.appendChild(element)   : HTML 요소 추가
		// document.replaceChild(element)  : HTML 요소 대치
		// document.write                  : HTML 출력 스트림에 쓰기
		
		let newElementBtn = document.getElementById("newElement");
		newElementBtn.addEventListener('click', function () {
			let btn = document.createElement("button");
			let t = document.createTextNode("CLICK ME");
			btn.appendChild(t);
			document.body.appendChild(btn);
		});
		
		// removeChild 예제
		let removeBtn = document.getElementById("removeChild");
		removeBtn.addEventListener('click', function () {
			let item = document.getElementById("myLI");
			item.parentNode.removeChild(item);
		});
		
		// appendChild 예제
		// 요소를 지정된 요소의 마지막 하위 노드로 추가한다.	
		let appendChildBtn = document.getElementById("appendChildBtn");
		appendChildBtn.addEventListener("click", function () {
			let node = document.createElement("li");
			let textNode = document.createTextNode("Water");
			node.appendChild(textNode);
			document.getElementById("myList").appendChild(node);
		});
		
		// replaceChild 예제
		let replaceChildBtn = document.getElementById("replaceChildBtn");
		replaceChildBtn.addEventListener("click",function () {
			let textnode = document.createTextNode("Water");
			let item = document.getElementById("myList2").childNodes[0];
			item.replaceChild(textnode, item.childNodes[0]);
		});
		
		// HTML 객체 찾기 
		// HTML 문서가 웹브라우저에 로드되면 문서 객체가 된다. document객체는 HTML 문서의 루트 노드이며
		// 다른 모든 노드의 "소유자" 이다. document 객체는 Javascript 내에서 모든 노드 객체에 엑세스 하기 위한 속성 및 메소드를 제공한다.
		// document.anchors : name 속성을 가진 모든 <a> 요소를 반환한다.
		// document.applets : 모든 <applet> 요소를 반환한다.
		// document.baseURL : document의 문서의 절대 기본 URL을 반환한다.
		// document.body : <body> 요소를 반환한다.
		// document.cookie : document의 쿠키를 반환한다.
		// document.doctype : document의 doctype 을 반환한다.
		// document.documentElement : <html> 요소를 반환한다.
		// document.documentMode : 브라우저에 사용된 모든 모드를 반환한다.
		// document.documentURL : document의 URL을 반환한다.
		// document.domain : document 서버의 도메인 이름을 반환한다.
		// document.embeds : 모든 <embed> 요소를 반환한다.
		// document.forms : 모든 <form>요소를 반환
	  /*
		document.anchors 컬렉션
		anchors는 name 특성에 있는 모든 a 요소모음을 반환한다. 
		컬렉션의 요소는 소스코드에 나타나는 순서대로 정렬된다. 
		
		속성/ 메서드                             설명
		length 							컬렉션에 있는 <a> 요소의 수를 반환한다.
		[index]						인덱스 값(0에서 시작)을 사용하여 컬렉션의 <a> 요소를 반환한다.
		item(index)					인덱스 값(0에서 시작)을 사용하여 컬렉션의 <a> 요소를 반환 한다.
		nameditem(id) 				지정된 id를 가진 컬렉션 <a>요소를 반환한다.
	  */
	  
	  let anchorsBtn = document.getElementById("anchorBtn");
	  anchorsBtn.addEventListener("click", function() {
		  let anchorsLength = document.anchors.length;
		  document.getElementById("demo1").innerHTML = "anchors.length" + anchorsLength ;
		  
		  let anchorsIndex = document.anchors[0].innerHTML;
		  document.getElementById("demo2").innerHTML = "anchors.index" + anchorsIndex;
		  
		  let anchorsInnerHtml = document.anchors.namedItem("ancMeth").innerHTML;
		  document.getElementById("demo3").innerHTML = anchorsInnerHtml;
	  });
	  
	/*  2) 자바 스크립트 HTML DOM 이벤트
	 onload와 onunload이벤트
	 
	 onload와 onunload 이벤트는 사용자가 페이지를 열거나 닫을때 발생한다.  
	 
	 onchange 이벤트
	 
	 onchange 이벤트는 요소의 값이 바뀌면 발생하는 이벤트이다. onchange이벤트는 종종 입력 필드의 유효성 검사
	 와 함께 사용된다.
	*/
	
	// onchange 예제 input 태그에 소문자가 입력시 대문자로 변경
	let onchangeTest = document.getElementById("frame");
	onchangeTest.onchange = () => {
		onchangeTest.value = onchangeTest.value.toUpperCase();
	}
	
	// onchange 예제 (물건품목/ 수량) 선택해서 계산
	let itemTest = document.getElementById("item");
	let countTest = document.getElementById("count");
	itemTest.onchange = () => {
		selectChange(itemTest,countTest);
	}
	
	countTest.onchange = () => {
		selectChange(itemTest,countTest);
	}
	
	// onmouseover/onmousout 이벤트
	let mouseOverOutTest = document.getElementById("mouseOverOut");
	mouseOverOutTest.onmouseover = () => {
		mouseOverOutTest.innerHTML = "Thank you";
	}
	
	mouseOverOutTest.onmouseout = () => {
		mouseOverOutTest.innerHTML = "Mouse over Me";
	}
	
	// onmousedown,onmouseup,onclick 이벤트
	let mouseDownUpClickTest = document.getElementById("onmouseClick");
	mouseDownUpClickTest.onmouseup = () => {
		mouseDownUpClickTest.style.backgroundColor = "#D94A38";
		mouseDownUpClickTest.innerHTML = "mouseup";
	}
	
	mouseDownUpClickTest.onmousedown = () => {
		mouseDownUpClickTest.style.backgroundColor = "#lec5e5";
		mouseDownUpClickTest.innerHTML = "mousedown";
	}
	
	// onfocus, onblur 이벤트
	let mouseonFocus = document.getElementById("mouseonfocusonblur");
	mouseonFocus.onfocus = () => {
		mouseonFocus.style.backgroundColor = "red";
	}
	
	mouseonFocus.onblur = () => {
		mouseonFocus.style.backgroundColor = "blue";
	}
	

});

function selectChange(item,count) {
	let itemValue = item.value;
	let countValue = count.value;
	
	if(itemValue && countValue) {
		let res = itemValue * countValue;
		document.getElementById("price").innerHTML = res.toLocaleString("ko-KR",{style:"currency",currency:"KRW"});
	}
}

</script>
</head>
<body>
	<p id="demo" class="pClass">Javascript can shange the HTML style</p>
	<p id="demo1" class="pClass"></p>
`	<p>Hello World!</p>
	<p id="classNameTest"></p>
	<button id="btn" >클릭</button>
	<button id="btnDisplay" > 보이기 기능 클릭</button>
	<button id="btnChangeValue"> Text 변경</button>

	<form id ="frm1">
		First name : <input type="text" name="fname" value="Donald"><br>
		Last name : <input type="text" name="lname" value="Duck"><br><br>
		<input type="submit" value="Submit">
	</form>
	<button id="collectionBtn">From 버튼</button>
	<p id="demo3"></p>	
	<br><br><br>
	<h1>속성값 변경 예 제 입니다</h1>
	<h1>Hello world</h1>
	<p id="myH1"> Good javascript...!</p>
	<button id="changeAttribute">Try it</button>
	<br><br>
	<h1>HTML 요소 추가/ 삭제하기</h1>
	<p>Create New Button element with text.</p>

	<button id="newElement">element Try it..</button>
	<h1>Remove Child</h1>
	<ul><li>Coffee</li><li id="myLI">Tea</li><li>Milk</li></ul>
	<p>remove the li element with id="myLI" from the list</p>
	<button id="removeChild">remove Try it</button>

	<h1>append Child</h1>
	<ul id="myList"><li>Coffee</li><li>Tea</li><li>Milk</li></ul>
	<p>Append an item to the end of the list.</p>
	<button id="appendChildBtn">append Try it</button>
	<br>
	
	<h1>replace Child</h1>
	<ul id="myList2"><li>Coffee</li><li>Tea</li><li>Milk</li></ul>
	<p>Append an item to the end of the list.</p>
	<button id="replaceChildBtn">replace child Try it</button><br>
	
	<a name="html">HTML Tutorial</a><br>
	<a name="css">CSS Tutorial</a><br>
	<a name="xml">XML Tutorial</a><br>
	<a name="ancMeth" href="http:www.naver.com">anchor Tutorial</a>
	
	<button id="anchorBtn">anchors 버튼</button>
	<p id="demo1"></p>
	<p id="demo2"></p>
	<p id="demo3"></p>
	
	Enter your name : <input type="text" id="frame">
	<p>transforms the input text to upper case.</p>
	
	<br><br>
	<select name="item" id="item">
		<option value="">품목</option>
		<option value="1000">오이</option>
		<option value="3000">호박</option>
	</select>
	
	<select name="count" id="count">
		<option value="">수량</option>
		<option value="1">1개</option>
		<option value="2">2개</option>
		<option value="3">3개</option>
	</select>
	<div>가격 <span id="price"></span></div>
	<br>
	<div id="mouseOverOut">First Display.</div>
	<br>
	<div id="onmouseClick" style="background-color:#D94A38;width:90px;height:20px;padding:40px;">Click me</div>

	Enter your name : <input type="text" id="mouseonfocusonblur">
</body>
</html>