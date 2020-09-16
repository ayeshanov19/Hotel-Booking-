<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">



  <title>travel</title>
<link rel="stylesheet" href="bootstrap-4.2.1-dist/css/bootstrap.min.css" type="text/css"/> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    

   <script src="../javascript/bootstrap-datepicker.js"></script>
   <link rel="stylesheet" href="../CSS/datepicker.css"/>
  

<script type="text/javascript" src="bootstrap-4.2.1-dist/js/bootstrap.min.js"></script> 

<script>
  $(document).ready(function(){
console.log("hi");
$( "#datepicker" ).datepicker({
    format: 'yyyy/mm/dd',
    startDate: '-0d',
    endDate: '+60d'
  });

 $( "#datepicker2" ).datepicker({
    format: 'yyyy/mm/dd',
    startDate: '-0d',
    endDate: '+60d'
 	});
 

// loadRoomPrice();
$("#1").hide();
 $("#2").hide();
 $("#3").hide();
 
 


  });


 

 function loadRoomPrice(){
	 $("#1").show();
	 $("#2").show();
	 $("#3").show();
	 
	var from= $("#datepicker").val();
	var to = $("#datepicker2").val();
	
	var startDate = Date.parse(from);
	
    var endDate = Date.parse(to);
	var timeDiff = endDate - startDate;
	noOfDays = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
	
	var pplCount = $("#pplCount").val();
	
	console.log("noOfDays ="+noOfDays);

    
	var objects = new Array();

	
	var obj = {'noOfDays':noOfDays,'pplCount':pplCount}
	var jsonObj = JSON.stringify(obj) 

    $.ajax({
			dataType: "json",
			method: "post",
			url: "rooms/getRooms",
			data : {"jsondata" : jsonObj},
			success: function(data) {
			console.log('success');
			var data= data.retObj;
			for(var i=0;i<data.length;i++){
				var newobj = data[i];
			    var roomtype= newobj.type;
			    var roomstatus= newobj.status;
			    var roomprice= newobj.price_per_person;
			   /*  tempObj['name'] = roomtype;
			    tempObj['status'] = roomstatus;
			    tempObj['price'] = roomprice*noOfDays*pplCount;
			    transformData.push(tempObj); */
			    objects.push({'name': roomtype,'status':roomstatus,'price':roomprice*noOfDays*pplCount});
			   
			    
			}
			console.log("data"+data);
            
			},
	 	error: function(data){
	 		console.log('error');
		}
 }); 
 var retObj = [{"name":'junior','status':'no', 'price':'250'},
 {'name':'superior', 'status':'yes','price':'500'},
 {'name':'standard', 'status':'yes','price':'300'}];  

 for(var i=0; i < retObj.length; i++){
  // console.log(retObj[i]);

  var objid= retObj[i];

    for(var key in objid){
      
      if(objid['name'] == 'junior'){
        if(objid['status']=='yes'){


          $('#juniorPrice').text(objid['price']);
           $('#juniorStatus').text('Status: Available');
          }
        else{

          $('#juniorStatus').text('Status : Not Available');
          $("#div1Price").hide();
          $("#bookJ").hide();
         }
        }

       if(objid['name'] == 'standard'){
        if(objid['status']=='yes'){
          $('#standardPrice').text(objid['price']);
          $('#standardStatus').text('Status: Available');
         
          }
        else{
          $('#standardStatus').text('Status : Not Available');
          $("#div2Price").hide();
          $("#bookS").hide();
         }
        }

      if(objid['name'] == 'superior'){
        if(objid['status']=='yes'){
          $('#superiorPrice').text(objid['price']);
          $('#superiorStatus').text('Status: Available');
          
          }
        else{
         $('#superiorStatus').text('Status : Not Available');
         $("#div3Price").hide();
         $("#bookSu").hide();
         }
        }
    }
  }



}
  
</script> 
<style>
      
.bg-dark{
  background-color: #008B8B!important;

}

.navbar-dark .navbar-nav .nav-link {
  color:black;
  }


  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  

  .img-container{
  position:relative;
  display:inline-block;
}
.img-container img{
display:block
 }
.img-container .overlay{
  position:absolute;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0,0,0,0.2);
  opacity:0;
  transition:opacity 500ms ease-in-out;
}
.img-container:hover .overlay{
  opacity:1;
}
.overlay span{
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  color:#fff;
}


  .carousel-inner img {
    width: 81%;
    height: 50%;
    float:left;
  }
.carousel-inner{
  width: 88%;
  margin-left: 172px;
}
.bg-success{
  background-color: #008B8B!important;
}
.bg-warning{
  background-color: #008B8B!important;
 
}
</style>
<body>

<div>
  <div>
    <h1>THE OBEROI HOTEL</h1>
  </div>

  <div>
      <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <!-- Brand/logo -->
        <div class="container">
          <a class="navbar-brand" href="#">

            <img src="../images/hotel.jpg" style="width:150px;">
          </a>
        </div>
      <div class="navbar-header">
        <!-- Links -->
        <ul class="navbar-nav">

          <li class="nav-item">
            <a class="nav-link"  href="default/home">HOME</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="exp/explore">EXPLORE</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="rooms/toAllRooms" >ROOMS</a>

              <li class="nav-item">
                <a class="nav-link" href="amen/amenities" >AMENITIES</a>
              </li>

          </li>

        </ul>

        
      </nav>
  </div>
</div>



<div class="row">
  <div class="column">
    
 <img src="../images/Screen Shot 2019-02-16 at 4.47.51 PM.png" class="img-thumbnail" style="width:251px; height:360px; margin-top: 96px; margin-left: 189px;"  >
  </div>



<div class="img-container">
  <img src="../images/130827171826-hotel-pillows-peninsula-2-horizontal-large-gallery.jpg" style="width:751px; height:360px; margin-top: 96px; margin-left: 19px;"  >>
  <div class="overlay">
    <span style="font-size: 40px; font-style: italic; ">with 20 luxurious and well appointed rooms</span>
  </div>
</div>
</div>



<div id="demo" class="carousel slide" data-interval="1500" data-ride="carousel">
  
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../images/gallery_stay14.jpg"  style="object-fit: cover;"alt="Los Angeles" width="900" height="500">
        
    </div>
    <div class="carousel-item">
      <img src=" ../images/2BFF873600000578-3199337-image-a-117_1441468867107.jpg" style="object-fit: cover; "alt="Chicago" width="1100" height="500">
      
    </div>
    <div class="carousel-item">
      <img src="../images/le-coq-16-2-1070x642.jpg" style="object-fit: cover;"alt="New York" width="1100" height="500">
      
  </div>
  <
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>



<div>
  <p style="margin-left: 170px; margin-top: 10px;">OUR ROOMS</p>
  <hr style="height:1px;border:none;color:#333;background-color:#333;" />
</div>


<div class="container-fluid">
    <div class="row" style="height: 50px; margin-left: 150px; margin-right: 190px; margin-top: 9px;">
      <div class="col-sm bg-success">
        
        <p >CHECK-IN: <input type="text" id="datepicker"></p>
      </div>
      <div class="col-sm bg-warning">
        <p >CHECK-OUT: <input type="text" id="datepicker2"></p>
      </div>
      <div class="col-sm bg-success">
        <p> NO. OF PERSONS: <BR> <input id="pplCount" type="number" MIN="1" MAX="200" STEP="1" VALUE="1" SIZE="6"> </p>
      </div>
      <div class="col-sm bg-warning">
       
<button type="button" id="search" onclick="loadRoomPrice()" class="btn btn-danger wrn-btn" style="margin-top: 19px;">Search</button>
 
      </div>
    </div>  

  </div>
  
</div>
 <hr style="height:1px;border:none;color:#333;background-color:#333;" />

 <!--junior suit-->
<div id="junior">
<img src="../images/Junior-suite-1280x730_0001s_0023_34181154073_31f977de25_o-1170x685.jpg" style=
"height: 290px; width: 390px ; margin-left: 177px;">

      <div style="width: 872px; float: right; margin-top: -4px;"> 
      <h1 style="float:right; margin-right: 590px; "> JUNIOR SUITE</h1>
       <p style="font-style: italic; font-size: 20px;  float:right; margin-right: 559px; ">
       our junior suits offer breathtaking <br> views of the city skyline.</p> 
       <ul>
        <li>size 260sq ft</li>
        <li>Beds: 2Doubles(s)
      </ul>
<div id="1">
       <div id="div1Price">
        <p id ='juniorPrice'style="float: right; margin-top: -97px; margin-right: 396px;" > 
        </p>
       
      </div>
     
     <div id="div1Status">
       <p id ='juniorStatus'style="float: right; margin-top: -133px; margin-right: 363px;" >
        </p>
          </div>
      <button type="button" id="bookJ"class="btn btn-info" style=" margin-top: -54px;
          margin-left: 425px;"  onclick="location.href='book.html';" >BOOK </button>

</div>

      <hr style="height:1px;border:none;color:#333;background-color:#333;" />
      <div class="container">
        <div class="row" style="margin-left:12px;">
        <i class="fa fa-wifi" style="font-size: 40px; width:60px; color: pink;" aria-hidden="true"></i>
        <i class="fas fa-snowflake" style="font-size: 40px; width:60px;color: pink;"> </i>
        <i class="fas fa-phone-square" style="font-size: 40px; width:60px; color: pink;"></i>
        <i class="fas fa-tv" style="font-size: 40px; width:60px; color: pink;"></i>
        <i class="fas fa-utensils" style="font-size: 40px; width:60px; color:pink;"></i>
      </div>
      </div>
      <hr style="height:1px;border:none;color:#333;background-color:#333;" />
        </div>
  <hr style="height:1px;border:none;color:#333;background-color:#333;" />

</div>


<div id="standard"><!-- standard room -->
<img src="../images/1.jpg" style=
"height: 300px; width: 390px ; margin-left: 177px;">

<div style="width: 872px; float: right; margin-top: -1px;"> 
<h1 style="float:right; margin-right: 631px; margin-left: 11px; size: 900px;">STANDARD </h1>
 <p style="font-style: italic; font-size: 20px;  float:right; margin-right: 559px; margin-left: 31px;">
 our standard roons are the perfect combination of function & comfort.</p> 
 <ul>
  <li>size 230sq ft</li>
  <li>Beds: 1Double(s)
</ul>
<div id="2">
<button type="button" id="bookS" class="btn btn-info" style=" margin-top: -54px;
    margin-left: 425px;"  onclick="location.href='book.html';" >BOOK</button>
<div id="div2Price">
  <p id ='standardPrice'style="float: right; margin-top: -97px; margin-right: 396px;" > 
        </p></div>
<div id="div2Status">
      <p id ='standardStatus'style="float: right; margin-top: -133px; margin-right: 363px;" >
        </p>
    </div>
  </div>

<hr style="height:1px;border:none;color:#333;background-color:#333;" />
<div class="container">
  <div class="row" style="margin-left:12px;">
  <i class="fa fa-wifi" style="font-size: 40px; width:60px; color: blue;" aria-hidden="true"></i>
  <i class="fas fa-snowflake" style="font-size: 40px; width:60px; color: blue;"> </i>
  <i class="fas fa-phone-square" style="font-size: 40px; width:60px; color: blue;"></i>
  <i class="fas fa-tv" style="font-size: 40px; width:60px; color: blue;"></i>
  <i class="fas fa-utensils" style="font-size: 40px; width:60px; color: blue;"></i>
  <i class="fas fa-bed" style="font-size: 40px; width:60px; color: blue;"></i>
</div>
</div>
<hr style="height:1px;border:none;color:#333;background-color:#333;" />
  </div>
  <hr style="height:1px;border:none;color:#333;background-color:#333;" />
</div>

<!-- superior room -->
<div id="superior">
<img src="../images/c7beb487b2b54736cfcb842d02463724.jpg" style=
"height: 320px; width: 390px ; margin-left: 177px;">

<div style="width: 872px; float: right; margin-top: -5px; " > 
<h1 style="float:right; margin-right: 590px; margin-left: 31px;"> SUPERIOR ROOMS</h1>
 <p style="font-style: italic; font-size: 20px;  float:right; margin-right: 559px; margin-left: 31px; ">
 our superior rooms are comfortable & elegant.</p> 
 <ul>
  <li>size 280sq ft</li>
  <li>Beds: 1King(s)
</ul>
<div id="3">
<button type="button" class="btn btn-info" style=" margin-top: -54px;
    margin-left: 425px;"  id="bookSu" onclick="location.href='book.html';">BOOK</button>
    <div id="div3Price">
  <p id ='superiorPrice'style="float: right; margin-top: -97px; margin-right: 396px;" > 
        </p></div>
<div id="div3Status">
      <p id ='superiorStatus'style="float: right; margin-top: -133px; margin-right: 354px;" >
        </p>
    </div>
</div>
<hr style="height:1px;border:none;color:#333;background-color:#333;" />
<div class="container">
  <div class="row" style="margin-left:12px;">
  <i class="fa fa-wifi" style="font-size: 40px; width:60px; color: red;" aria-hidden="true"></i>
  <i class="fas fa-snowflake" style="font-size: 40px; width:60px; color: red;"> </i>
  <i class="fas fa-phone-square" style="font-size: 40px; width:60px; color: red;"></i>
  <i class="fas fa-tv" style="font-size: 40px; width:60px; color: red;"></i>
  <i class="fas fa-utensils" style="font-size: 40px; width:60px; color: red;"></i>
  <i class="fas fa-bath" style="font-size: 40px; width:60px; color: red;"></i>
  <i class="fas fa-shower" style="font-size: 40px; width:60px; color: red;"></i>
  <i class="fas fa-glass-cheers" style="font-size: 40px; width:60px; color: red;"></i>
</div>
</div>
<hr style="height:1px;border:none;color:#333;background-color:#333;" />
  </div>
 


</div>



</body>
</html>
