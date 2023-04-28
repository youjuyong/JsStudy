<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		
		function foo(a) {
			const b = 2;
			return a+ b;
		}
		
		function bar(x) {
			const y = 1;
			return foo(x + y);
		}
		
		const baz = bar(1); // 4는  baz에 할당된다.
		console.log(baz);
		
		console.log(1);
		setTimeout(() => {
			console.log(2);
		},0);
		console.log(3);
	});

</script>
</head>
<body>
<h1>자바 스크립트 이벤트 루프</h1>
"자바 스크립트는 싱글 쓰레드 기반이며 논 블로킹 방식의 비동기적인 동시성 언어이며 콜 스택, 이벤트루프와 콜백 큐 그리고
여러가지 다른 API를 가지고 있다."

여기서 '단일 쓰레드'란 <h2>동시에 하나의 작업만 처리 할 수 있다는 의미이다.</h2>. 하지만 자바스크립트를 개발하다보면
동시에 여러 작업을 수행하는것을 볼수 있는데 이모든것이 이벤트 루프 덕분이다.

   "※자바스크립트는 이벤트루프를 이용해서 비동기 방식으로 동시성을 제공한다."
	
	---------------------------------
	|								|
	|	   Heap		 	Call Stack	|
	|	----------	   ------------	|
	|	|		 | 	   |		  |	|                      WEP API
	|	|		 |	   |		  |	|     			------------------------
	|	|		 |	   |		  |	|	=========>	|     DOM (document)   |
	|	|		 |	   |		  |	|				------------------------
	|	|		 |	   | ======== |	|				------------------------
	|	|		 |	   | ======== |	|				| Ajax (XMLHttpRequest)|
	|	|		 |	   | ======== |	|				------------------------
	|	----------	   ------------	|				------------------------
	|								|				| setTimeout		   |
	|								|				------------------------
	|								|						   | |
	---------------------------------						   | |
 															 --   --
 															 \     /
 															  \   /
 															   \ /
 													
 													-------------------------
 						§ 이벤트 루프       <========= | - -                    |
 													------------------------- 
 													         콜백 스택
 													         
 	Heap : 메모리가 할당 되는곳.
 	선언한 변수, 함수가 담겨져 있다.
 	
 	Call Stack 
 	코드가 실행 될때 쌓이는 곳 
 	단 하나의 호출 스택을 사용하기 때문에 자바 스크립트의 함수가 실행되는 방식을 "Run to Completion" 이라고 부른다.
 	이는 하나의 함수가 실행이 되면 이 함수가 끝날때까지 다른 작업은 끼어들지 못한다.
 	
 	요청이 들어올때마다 순차적으로 호출스택을 담아 처리합니다. 함수의 호출들은 "프레임" 스택을 형성한다고 말합니다. 함수가 실행되면
 	Call Stack 에 새로운 프레임이 생기고 처리가 끝나면 없어지는 원리이다.
 	
 	요청이 들어올때마다 순차적으로 호출 스택을 담아서 처리합니다. 함수의 호출들은 "프레임" 스택을 형성한다고 말한다. 함수가 실행 되면
 	Call Stack 에 새로운 프레임이 생기고 처리가 끝나면 없어지는 원리입니다.
	
		function foo(a) {
			const b = 2;
			return a+ b;
		}
		
		function bar(x) {
			const y = 1;
			return foo(x + y);
		}
		
		const baz = bar(1); // 4는  baz에 할당된다.
		console.log(baz);
	
	위 코드의 동작 과정에 대해 알아보면 
	
	1. bar()가 호출 될때, 첫번째 프레임이 생성되어 콜스택에 쌓인다.
	2. bar() 안에 있는 foo()가 호출될때, 콜스택 첫번째 프레임 위로 두번째 프레임이 생성되어 쌓인다.
	3. foo() 가 반환 되면 두번째 프레임은 없어진다. (이제 콜스택에는 bar 프레임만 남았다)
	4. bar() 가 반환 되면 첫번째 프레임이 없어져 콜스택인 이제 비었다.
	
	Web APIs
	web apis 는 자바 스크립트 엔진 밖의 그려져 있는 것을 확인 할수 있는데 
	즉 자바 스크립트 엔진이 아니다.  이는 웹 브라우저 에서 제공하는 API로 비동기인 setTimeout , Promise가 있다.
	Call Stack 에서 실행 된 비동기 함수들은 모두 Web Api를 호출한다. 그리고 Web api 는 콜백함수를 Callback Queue에 넣습니다.
	
	※예제
	console.log(1);
	setTimeout(()-> {console.log(2);
	},0); 	
	console.log(3);
	
	1. console.log(1) 이 콜스택에 들어가 실행 됩니다.( 타고 들어가는 함수가 없으므로 바로 실행 되어 사라집니다.)
	2. setTimeout을 만나 콜스택은 이를 Web API로 보냅니다.
	3. console.log(3) 이 콜스택에 들어가 실행 됩니다.
	
	* Web API에 있는 setTimeout은 0ms 후에 해당 콜백을 CallBack Queue에 넣습니다. 그리고 콜스택이 비워지면 CallBack Queue에 있는 것을
	콜스택에 가져와 console.log(2)를 실행 한다.
	
	중요한점은 비동기 코드를 만나면 WebAPI 영역으로 빠지고 그콜백은 바로 콜스택에 가는 것이 아닌 큐로 빠진다는점이다.
	
	Callback Queue 란?
	앞서 Web API에서 설명 했듯이 비동기적으로 실행된 콜백함수가 보관되는 곳 이다. 콜스택에 가기 위한 "대기열" 이라고 생각하면 된다.
	여기에 있는 콜백 함수들은 콜스택이 비어졌을때 먼저 대기열에 들어온 순서대로 수행된다.
	
	여기서 주의 할점은 단순히 모든 비동기 코드가 이곳에 쌓이는게 아니다.
	Callback Queue에는 세가지 종류가 있는데
	
	---------------------------------
	|								|
	|	   Heap		 	Call Stack	|
	|	----------	   ------------	|
	|	|		 | 	   |		  |	|                      WEP API
	|	|		 |	   |		  |	|     			------------------------
	|	|		 |	   |		  |	|	=========>	|     DOM (document)   |
	|	|		 |	   |		  |	|				------------------------
	|	|		 |	   | ======== |	|				------------------------
	|	|		 |	   | ======== |	|				| Ajax (XMLHttpRequest)|
	|	|		 |	   | ======== |	|				------------------------
	|	----------	   ------------	|				------------------------
	|								|				| setTimeout		   |
	|								|				------------------------
	|								|						   | |
	---------------------------------						   | |
 															 --   --
 															 \     /
 															  \   /
 															   \ /
 													
 													-------------------------
 						§ 이벤트 루프       <========= | - -                    | : MacroTask Queue
 													-------------------------  
 													--------------------------
 													|                        | : Microtask Queue         
 	       									 	    -------------------------
													--------------------------
												    |                        |  : Animation Frames
												    --------------------------
												    
	1. MacroTask Queue : 
	SetTimeout, setInterval 과 같은 코드이다.
	
	2. Microtask Queue :
	Promise callback, async callback과 같은 코드이다.
	
	3. Animation Frames :
	requestAnimationFrame 과 같은 코드입니다.
	
	"Microtask Queue > Animation Frame > MacroTask Queue" ,순으로  Microtask Queue가 가장 먼저 실행되고
	MacroTask Queue가 가장 늦게 실행된다.
	
	
				
</body>
</html>
