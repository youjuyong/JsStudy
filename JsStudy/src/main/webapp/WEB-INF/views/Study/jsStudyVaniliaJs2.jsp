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
   // DOM 노드(Nodes)
   // HTML 문서가 웹 브라우저에 로드되면 웹 페이지는 문서 객체가된다. document 객체는
   // HTML 문서의 루트 노드 이다. document 객체는 자바 스크립트 내에서 모든 노드 객체에 액세스
   // 하기 위한 속성 및 메소드를 제공한다. 이들 속성과 메서드를 사용하면 새노드를 만들수 있으며, 모든 노드를 수정하거나
   // 삭제 할 수 임ㅆ다. 노드 간의 관계는 서로 계층적 관계를 가진다.
	/* 
	 (1) DOM 노드 탐색
	 DOM 노드는 자식 노드와 부모 노드의 관계를 이용하여 해당노드를 탐색할 수 있다.
	 
	 노드 탐색								설 명
	 parentNode  				현재 노드의 부모 노드를 찾는다.
	 childNodes[nodenumber]    현재 노드의 자식 노드를 찾아 배열로 반환한다.
	 firstChild 				현재노드의 첫번 째 자식 노드를 찾는다.
	 lastChild					현재 노드의 마지막 자식 노드를 찾는다.
	 nextSbiling				현재노드의 다음 형제를 찾는다.
	 previousSibling		   현재 노드의 이전 형제 노드를 찾는다.
	 
	 노드 탐색을 위해서는 먼저 노드와 노드값(nodeValue)에 대한 이해가 필요하다.
	 <title id="demo"> DOM tutorial </title>
	 
	 요소 노드 <title>은 텍스트를 포함하지 않는다. 여기에는 "DOM Tutorial" 값이 있는 텍스트 노드가 들어있다
	 텍스트 노드의 값은 노드의 innerHTML 속성을 통해 엑세스 할 수 있다. 간혹 텍스트 노드와 텍스트를 혼돈하여 사용할 우려가 있다.
	 
	 let myTitle = document.getElementById("demo").innerHTML;
	 
	 id="demo" 인 요소의 innerHTML 속성에 액세스 하는 것은 해당 요소의 첫 번째 자식의 노드 값(nodeValue)에 엑세스 하는 것과
	 같다. 즉
	 
	 let myTitle = document.getElementById("demo").firstChild.nodeValue;
	 
	 위 방법 외에도 childNode를 배열로 취급하여 엑세스 할 수있다 
	 
	노드의 접근
	
	1.getElementsByTagname() 메소드를 이용하는 접근
	2. 노드 간의 관계를 이용한 접근
	
	getElementsByTagName() 메소드를 이용한 접근 방법
	- getElementsByTagName() 메소드는 특정 태그 이름을 가지는 모든 요소를 노드 리스트
	형태로 반환 합니다.
	
	따라서 이 메소드가 반환하는 노드 리스트를 이용하면 원하는 노드에 접근할 수 있습니다.
	*/
	let selectedItem = document.getElementsByTagName("p");
	 
	 for(let i = 0; i <selectedItem.length; i++) {
		 selectedItem.item(i).style.color = "red";
	 }
	
	 /* 아이디(id)를 이용한 선택
	  - getElementById() 메소드는 아이디를 이용하여 HTML요소 를 선택합니다. */
	  
	  let selectedItem2 = document.getElementById("ulTest");
	  let selectedIdLength = selectedItem2.childNodes.length;
	  for(let i = 0; i < selectedIdLength; i++) {
		  let text = selectedItem2.childNodes[i].id;
		  if(selectedItem2.childNodes[i].id =="li2") {
			  alert(text);
		  }
	  }
	  
	  /* 클래스(class)를 이용한 선택
	  - getElementsByClassName() 메소드는 클래스이름을 이용하여 HTML 요소를 선택합니다.
	   */
	  
	  let selectedItem3 = document.getElementsByClassName('box');
	  for(let i = 0; i < selectedItem3.length; i++) {
		  selectedItem3.item(i).style.border="2px solid #0000ff";
	  }
	  
	  /* name 속성을 이용한 선택
	  - getElementByName() 메소드는 HTMl요소의 name 속성을 이용하여 HTML 요소를 선택합니다.
	  */
		let selectedItem4 = document.getElementsByName("nameTest");
	  	for(let i =0; i < selectedItem4.length; i++){
	  		let value = selectedItem4.item(i).value;
	  	}
	  	
	  /*
	  	CSS 선택자(seletor)를 이용한 선택
	  - querySeletorAll() 메소드는 CSS 선택자(아이디, 클래스,속성,속성값 등)을 이용하여 HTMl 요소를 선택한다.
	  */
	  
	  let selectedItemSelector = document.querySelectorAll("li.selector");
	  for(let i = 0; i < selectedItemSelector.length; i++) {
		  let value = selectedItemSelector.item(i).style.color = "blue";
		  console.log(value);
	  }
});



</script>
</head>
<body>
	<div id="demo">
		<p id="p1">apple</p>
		<p id="p2">banana</p>
		<p id="p3">kiwi</p>
	</div>
	<ul id="ulTest">
		<li id="li1">lion</li>
		<li id="li2">tiger</li>
		<li id="li3">rabbit</li>	
	</ul>
	
  <div class="box">
 	 <p>자바 스크립트 스터디 공부</p>
 	 <div id="shopinfo">
    	<p class="box">장소：학교</p>
   	 <p class="box">시간：12시</p>
 	 </div>
   </div>
  
 전화번호 : <input type ="text" value="1" name="nameTest"><br>
 주소 :  <input type ="text" value="2" name="nameTest"><br>
 이름 :  <input type ="text" value="3" name="nameTest"><br>

	<ul>
		<li class ="selector">gold</li>
		<li class ="selector">silver</li>
		<li class ="selector">bronze</li>
	</ul>
</body>
</html>