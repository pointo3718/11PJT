<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

function fncAddPurchase() {
		
	/* document.addPurchase.submit(); action="/purchase/addPurchase*/
	$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
}

	$(function(){
		$( "button" ).on("click" , function() {
			fncAddPurchase();
		}); 
	});
	$(function(){
		$("a[href='#' ]").on("click" , function() {
			history.go(-1);
		});
	});
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">�� ǰ �� ��</h1>
<form class="form-horizontal" name="addPurchase">

<input type="hidden" name="prodNo" value="${product.prodNo}" />

		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="prodNo" name="prodNo" value="${product.prodNo}" readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		     </div>
		</div>

		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="prodName" name="prodName" value="${product.prodName}" readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="prodDetail" name="prodDetail" value="${product.prodDetail}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="manuDate" name="manuDate" value="${product.manuDate}" readonly>
		       <img src="../images/ct_icon_date.gif" width="15" height="15"/>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label >
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="price" name="price" value="${product.price}" readonly>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="regDate" name="regDate" value="${product.regDate}" readonly>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="userId" name="userId" value="${user.userId}" readonly>
		    </div>
		  </div>

		<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
			<div class="col-sm-4">
			<select 	name="paymentOption"		class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">���ݰ���</option>
				<option value="2">ī�����</option>
			</select>
			</div>
		</div>
	
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="receiverName" name="receiverName" value="${user.userName}" readonly>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="receiverPhone" name="receiverPhone" value="${user.phone}" readonly>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="divyAddr" name="divyAddr" value="${user.addr}" readonly>
		    </div>
		  </div>
	
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="divyRequest" name="divyRequest" placeholder="���ſ�û����">
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="divyDate" name="divyDate" placeholder="����������">
		       <img src="../images/ct_icon_date.gif" width="15" height="15"
		     	 onclick="show_calendar('document.manuDateForm.divyDate', document.manuDateForm.divyDate.value)"/>
		    </div>
		  </div>



		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
			</div>
		</div>
		</form>

</body>
</html>