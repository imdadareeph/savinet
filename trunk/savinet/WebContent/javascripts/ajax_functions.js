function testCheck(){
    $("#uname").keyup(function(){
        var name = $("#uname").val();
        $.ajax({
            url:"test?name="+name,
            success:function(result){
                //$("#uerr").load(result);
                $("#uerr").load(location.href+" #uerr>*","");

            }
            });
    });
    

}
            
function nameCheck(){ 
    $("#uname").keyup(function(){
        var name = $("#uname").val();
        $.ajax({
            url:"namecheck?name="+name,
            success:function(result){
                $("#uerr").html(result);
            }
            });
    });
    $("#uname").change(function(){
        var name = $("#uname").val();
        $.ajax({
            url:"test?name="+name,
            success:function(result){
                $("#uerr").html(result);
            }
            });
    });

}

function searchUser(){
       
    $("#searchStr").keyup(function(){
       
        var name = $("#searchStr").val();
       
        $.ajax({
            url:"ajaxsearch?searchStr="+name,
            success:function(result){
               
                $("#searchDiv").html(result);
            }
            });
       
    });


}
function followUser(flag,userId){
    
 if(flag == "true"){
     
        $.ajax({
            url:"follow?ufUserId="+userId,
            success:function(result){
                
                $("#followDiv").html(result);
               // $("#homeFollowDiv").load("home?profileid="+userid, "", "")
            }
            });
 }else{
        $.ajax({
            url:"follow?fUserId="+userId,
            success:function(result){
                alert(result);
                $("#followDiv").html(result);
                
            }
            });
 }
}

                
