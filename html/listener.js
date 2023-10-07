$(function(){
	function display(bool){
		if(bool){
		   $("#content").show();
		} else {
		   $("#content").hide();
		}
   }
   function displayAlert(bool){
		if(bool){
			$('#alert').show();
		}else{
			$('#alert').hide();
		}
   }
   	displayAlert(false);
	display(false);
	window.addEventListener('message', function(event){

		var item = event.data;
		if(item.type == "msg"){
			if(item.display === true){
				if (item.inline === true){
					$('#header').addClass('header');
					$('#body').addClass('body');
				} else {
					$('#header').addClass('text-center');
				}
				if(item.round == true){
					$('#x').addClass('round');
				}
				$('#title').text(item.title);
				$('#message').text(item.msg);
				$('#x').addClass(item.col);
				$('#icon').html(item.icon);
				$('#content').addClass(item.position);
				//this.print("Javascript wurde angesprochen.");
				display(true);
			} else { display(false); }
		} else if(item.type === "alert"){
			if(item.display === true){
				if (item.Ainline == true){
					$('#header1').addClass('header1');
					$('#body1').addClass('body1');
				} else {
					$('#header1').addClass('text-center');
				}
				if(item.Around == true){
					$('#x1').addClass('round');
				}
				$('#message1').text(item.Amsg);
				$('#xl').removeClass().addClass(item.Acol);
				$('#alert').removeClass().addClass(item.Aposition);
				displayAlert(true);	
			} else displayAlert(false);
		}
	});

	document.onkeyup = function(data){
		if (data.which === 27) {
			$.post("https://cfx-nui-validant-notify/exit", JSON.stringify({}));
			return
		}
	}

	$("#close").click(function(){
		$.post("https://cfx-nui-validant-notify/exit", JSON.stringify({}));
		return
	})
});