<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<h2>BoardForm.jsp</h2>
	<hr>
	
	<form method="get" action="boardProc.jsp">	
		<!-- Title -->
		<div class="mb-3">
		    <input type="text" class="form-control" name="title" placeholder="Title..." 
		    	   id="title" aria-describedby="emdailHelp">
		 </div>
		
		<!-- Contexts -->
		<div class="mb-3">
		 	<label for="exampleFormControlTextarea1" class="form-label"></label>
		 	<textarea class="form-control" name="cont" id="context" 
		 			  rows="10" placeholder="type your thoughts..."></textarea>
		</div>
		
		<!-- User info -->
		<div class="row g-3 align-items-center">
			<!-- User id input -->
		 	<div class="col-auto">
		   		<label for="inputPassword6" class="col-form-label">ID</label>
		 	</div>
		 	<div class="col-auto">
		   		<input type="text" name="id" id="id" class="form-control" aria-describedby="passwordHelpInline">
		 	</div>		
			<!-- User pw input -->
		 	<div class="col-auto">
		   		<label for="inputPassword6" class="col-form-label">Password</label>
		 	</div>
		 	<div class="col-auto">
		   		<input type="password" name="pw" id="pw" class="form-control" maxlength='8' aria-describedby="passwordHelpInline">
		 	</div>
		 	<div class="col-auto">
		   		<span id="passwordHelpInline" class="form-text">
		     		Must be less than 8 characters.
		   		</span>
		 	</div>
		</div>
		
		<!-- Submit btn -->
		<button type="submit" id="btn" disabled class="btn btn-primary">Submit</button>
	</form>
	
	<script>
		let title = document.getElementById('title');
	    let context = document.getElementById('context');
	    let id = document.getElementById('id');
	    let pw = document.getElementById('pw');
	    let btn = document.getElementById('btn');
	    let check = [0, 0, 0, 0];
		title.addEventListener("input", function(){
	        if(this.value.trim() != ""){
	            check[0] = 1;
	            console.log("input detected, title")
	        }
	        else check[0] = 0;
	        changeBtnMod()
	    });
	    context.addEventListener("input", function(){
	        if(this.value.trim() != ""){
	            check[1] = 1;
	            console.log("input detected, context")
	        }
	        else check[1] = 0;
	        changeBtnMod()
	    });
	    id.addEventListener("input", function(){
	        if(this.value.trim() != ""){
	            check[2] = 1;
	            console.log("input detected, id")
	        }
	        else check[2] = 0;
	        changeBtnMod()
	    });
	    pw.addEventListener("input", function(){
	        if(this.value.trim() != ""){
	            check[3] = 1;
	            console.log("input detected, pw")
	        }
	        else check[3] = 0;
	        changeBtnMod()
	    });
	    
	    function changeBtnMod(){
	        const isFilled = check.every(check => check === 1)
	        console.log(isFilled);
	        btn.disabled = !isFilled;
	    }
	</script>
</body>
</html>