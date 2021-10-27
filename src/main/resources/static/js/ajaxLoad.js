    $(document).ready(function () {
        var file;

        $('input[type=file]').on('change', function (e) {
            file = e.target.files[0];
        });

        $('#upload').on('click', function (e) {
            e.preventDefault();
            var input = $('#file').val();

            if (input == '' || input == undefined) {
                alert("Please select a file to upload.");
            } else {


                var data = new FormData();
                
                console.log(data);
                
                if (file.type.substring(0, 5).toLowerCase() == 'image') {
                    data.append('file', file, file.name);
                    
                    for (var key of data.keys()) {
						   console.log(key);
					}
					
					for (var value of data.values()) {
						console.log(value);
					}

                    $.ajax({
                        url: '/upload',
                        type: 'POST',
                        data: data,
                        cache: false,
                        dataType: 'json',
                        processData: false,
                        contentType: false,
                        beforeSend: function (xhr) {
                            $('#alert').css('visibility', 'hidden');
                            $('#alert').removeClass('alert-success');
                            $('#alert').removeClass('alert-danger');
                            $('#message').text('');
							$('#audioName').text(data.message);
                            $('#aws-link').text('');
                            $('#aws-link').css('visibility', 'hidden');
                            $('#progress-bar').removeClass('bg-success');
                            $('#progress-bar').css('width', 0 + '%');
                            $('#progress-bar').text('0%');
                            $('#progress-bar').attr('aria-valuenow', 0);
                            $('#progress').css('visibility', 'visible');
							//css 에서 바꿨다만 더 추가합니다
							$('#objectCard1').css('visibility', 'hidden');
							$('#objectCard2').css('visibility', 'hidden');
							$('#objectCard3').css('visibility', 'hidden');
							$('#object').text('');
							$('#objectCardList').text('');
							$('#objectCardList').className = "row align-middle";
							$('#newid').remove();
							
							

                        },
                        success: function (data) {
                            $('#file').val('');
                            $('#progress').css('visibility', 'hidden');
                            $('#alert').css('visibility', 'visible');
                            
                            if(data.success.toLowerCase() == "true" ){
                                $('#alert').addClass('alert-success');
                                $('#alert-heading').text('Upload Completed!');

                                $('#aws-link').text(data.url);
                                $('#aws-link').attr('href', data.url); 
                                $('#aws-link').css('visibility', 'visible');
                                				    
							    
								console.log(data);
								
								let key = "";
								let keys = [];
								let values = [];
								let findString = "object";
								let objectCard = 0;
								
								while(keys.length>0){
									keys.pop();
								}
								
								for(key in data){
									keys.push(key);
									values.push(data[key]);
									
									if(key.indexOf(findString) != -1) {
										console.log(key + " : " + data[key]);
										console.log(jQuery.type(key));
										
										//test 용
										//let $newStudent = $("<li>"+data[key]+"</li>");
										//$("#object").append($newStudent);
										
										//랜덤지정 - 색상
										objectCard = Math.floor(Math.random() * 3) + 1;
										
										//색깔 변경
										if(objectCard==1){
											let $originalObject = document.getElementById('objectCard1');
											
											let $newObject = $originalObject.cloneNode(true);
											$newObject.style.visibility = 'visible';
											let $targetDiv = $newObject.getElementsByClassName("txt")[0];
											//$targetDiv.innerHTML = "<h2>Goodbye world!</h2>";
											$targetDiv.innerHTML = "<h2>"+data[key]+"</h2>";
											
											let $targetDiv2 = $newObject.getElementsByClassName("more")[0];
											$targetDiv2.innerHTML = "<a href='javascript:void(0);' onclick='createDiv(&quot;"+data[key]+"&quot;);'>more</a>";
											
											document.getElementById('objectCardList').appendChild($newObject);
										}
										else if(objectCard==2){
											let $originalObject = document.getElementById('objectCard2');
											
											let $newObject = $originalObject.cloneNode(true);
											$newObject.style.visibility = 'visible';
											let $targetDiv = $newObject.getElementsByClassName("txt")[0];
											//$targetDiv.innerHTML = "<h2>Goodbye world!</h2>";
											$targetDiv.innerHTML = "<h2>"+data[key]+"</h2>";
											
											let $targetDiv2 = $newObject.getElementsByClassName("more")[0];
											//console.log("heyyyyyyyyyyyy"+data.audioName);
											$targetDiv2.innerHTML = "<a href='javascript:void(0);' onclick='createDiv(&quot;"+data[key]+"&quot;);'>more</a>";

											
											document.getElementById('objectCardList').appendChild($newObject);
										}
										else{
											let $originalObject = document.getElementById('objectCard3');
											
											let $newObject = $originalObject.cloneNode(true);
											$newObject.style.visibility = 'visible';
											let $targetDiv = $newObject.getElementsByClassName("txt")[0];
											//$targetDiv.innerHTML = "<h2>Goodbye world!</h2>";
											$targetDiv.innerHTML = "<h2>"+data[key]+"</h2>";
											
											let $targetDiv2 = $newObject.getElementsByClassName("more")[0];
											$targetDiv2.innerHTML = "<a href='javascript:void(0);' onclick='createDiv(&quot;"+data[key]+"&quot;);'>more</a>";
											
											document.getElementById('objectCardList').appendChild($newObject);
										}

									}
								
								}

                                
                            }else{
                                $('#alert').addClass('alert-danger');
                                $('#alert-heading').text('Error!');
                                $('#aws-link').css('visibility', 'hidden');

                            }
                            $('#message').text(data.message);
							
 
                            
                            
                        },
                        xhr: function () {
                            var xhr = new window.XMLHttpRequest();
                            xhr.upload.addEventListener("progress", function (e) {
                                if (e.lengthComputable) {
                                    var percentComplete = e.loaded / e.total;
                                    percentComplete = parseInt(percentComplete * 100);
                                    $('#progress-bar').text(percentComplete + '%');
                                    $('#progress-bar').css('width', percentComplete + '%');

                                    if (percentComplete == 100) {
                                        setTimeout(function () {
                                            $('#progress-bar').addClass('bg-success');
                                            $('#progress-bar').text('Processing...');
                                        }, 1000);
                                    }
                                }
                            }, false);
                            return xhr;
                        }
                    });
                } else {
                    alert("Please select an image file");
                }
            }
        });
        
        
        $('#upload2').on('click', function (e) {
            e.preventDefault();
            var input = $('#file2').val();

            if (input == '' || input == undefined) {
                alert("Please select a file to upload.");
            } else {


                var data = new FormData();
                if (file.type.substring(0, 5).toLowerCase() == 'audio') {
                    data.append('file', file, file.name);

                    $.ajax({
                        url: '/upload2',
                        type: 'POST',
                        data: data,
                        cache: false,
                        dataType: 'json',
                        processData: false,
                        contentType: false,
                        beforeSend: function (xhr) {
                            $('#alert').css('visibility', 'hidden');
                            $('#alert').removeClass('alert-success');
                            $('#alert').removeClass('alert-danger');
                            $('#message').text('');

							$('#audioName').text('');

                            $('#aws-link').text('');
                            $('#aws-link').css('visibility', 'hidden');
                            $('#progress-bar').removeClass('bg-success');
                            $('#progress-bar').css('width', 0 + '%');
                            $('#progress-bar').text('0%');
                            $('#progress-bar').attr('aria-valuenow', 0);
                            $('#progress').css('visibility', 'visible');
                        },
                        success: function (data) {
                            $('#file').val('');
                            $('#progress').css('visibility', 'hidden');
                            $('#alert').css('visibility', 'visible');


                            if(data.success.toLowerCase() == "true" ){
                                $('#alert').addClass('alert-success');
                                $('#alert-heading').text('Upload Completed!');
                                //$('#aws-link').text(data.url);
                                //$('#aws-link').attr('href', data.url);
                                //$('#aws-link').css('visibility', 'visible');
                            }else{
                                $('#alert').addClass('alert-danger');
                                $('#alert-heading').text('Error!');
                                $('#aws-link').css('visibility', 'hidden');

                            }
                            $('#message').text(data.message);
							$('#audioName').text(data.audioName);
							console.log(data.audioName);
                        },
                        xhr: function () {
                            var xhr = new window.XMLHttpRequest();
                            xhr.upload.addEventListener("progress", function (e) {
                                if (e.lengthComputable) {
                                    var percentComplete = e.loaded / e.total;
                                    percentComplete = parseInt(percentComplete * 100);
                                    $('#progress-bar').text(percentComplete + '%');
                                    $('#progress-bar').css('width', percentComplete + '%');

                                    if (percentComplete == 100) {
                                        setTimeout(function () {
                                            $('#progress-bar').addClass('bg-success');
                                            $('#progress-bar').text('Processing...');
                                        }, 1000);
                                    }
                                }
                            }, false);
                            return xhr;
                        }
                    });
                } else {
                    alert("Please select an audio file");
                }
            }
        });
        
    })