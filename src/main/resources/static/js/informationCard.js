function createDiv(thisObj) {
	
	let color = Math.floor(Math.random() * 4) + 1;
	
	try{
		//var myobj = document.getElementById("newid");
		var myobj = document.getElementById("newDIV");
		myobj.remove();
	}
	catch{
		
	}
	
	let $specifyCard = document.getElementById('specifyCard1');
	
	if(color==1){
		$specifyCard = document.getElementById('specifyCard1');
	}
	else if(color==2){
		$specifyCard = document.getElementById('specifyCard2');
	}
	else if(color==3){
		$specifyCard = document.getElementById('specifyCard3');
	}
	else if(color==4){
		$specifyCard = document.getElementById('specifyCard4');
	}
	
	let $newspecifyCard = $specifyCard.cloneNode(true);
	$newspecifyCard.id = "newid";
	let $targetObject = $newspecifyCard.getElementsByClassName("txt")[0];
	
	
	if(color==1){
		$targetObject.innerHTML = `
							<h2>${thisObj}</h2>
							<p>Please Speak "I can see ${thisObj}" loudly</p>
							<img src='https://assets.codepen.io/2301174/icon-supervisor.svg' alt=''>
							`;
	}
	else if(color==2){
		$targetObject.innerHTML = `
							<h2>${thisObj}</h2>
							<p>Please Speak "I can see ${thisObj}" loudly</p>
							<img src='https://assets.codepen.io/2301174/icon-team-builder.svg' alt=''>
							`;
	}
	else if(color==3){
		$targetObject.innerHTML = `
							<h2>${thisObj}</h2>
							<p>Please Speak "I can see ${thisObj}" loudly</p>
							<img src='https://assets.codepen.io/2301174/icon-calculator.svg' alt=''>
							`;
	}
	else if(color==4){
		$targetObject.innerHTML = `
							<h2>${thisObj}</h2>
							<p>Please Speak "I can see ${thisObj}" loudly</p>
							<img src='https://assets.codepen.io/2301174/icon-karma.svg' alt=''>
							`;
	}

	
	
	
	
	let ratingBtn = document.createElement('input');
	ratingBtn.setAttribute("type", "button");
	ratingBtn.setAttribute("id", "apiBtn");
	ratingBtn.setAttribute("value", "Rating");
	ratingBtn.onclick = ()=> button1_click(thisObj);
	$targetObject.appendChild(ratingBtn);
	
	let section = document.getElementById('plz');
	
	
	let div = document.createElement('div');
	div.className = "container h-50";
	div.id="newDIV";
	
	let div2 = document.createElement('div');
	div2.className = "row justify-content-md-center";
	
	
	
	div2.appendChild($newspecifyCard);
	div.appendChild(div2);
	section.appendChild(div);
	
}


function button1_click(objName){
	let inputAudio = document.getElementById('audioName').innerText;
	console.log(inputAudio);
	
	try{
		window.open(`/printScore?audioName=${inputAudio}&objName=${objName}`,'_blank');
		console.log("Yeahhhhhhhhhhh");
	}catch(e){
		console.log(e);
	}
}

