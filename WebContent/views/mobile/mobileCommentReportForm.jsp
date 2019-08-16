<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mobile.model.vo.*"%>
<%
    MobileComment mc = (MobileComment)request.getAttribute("mc");
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8"> 
<title>신고</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- Google WebIcon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- Google WebFont -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Bootstrap 4.3.1 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<style>
    #report{
        width: 600px;
        padding: 30px;
    }
    #report table {
        margin: auto;
    }
    #report h3 {
        text-align: center;
        margin: 0 0 30px 0;
    }
    #report th {
        text-align: center;
        font-size: 16px;
        width: 100px;
        height: 50px;
    }
    #report tr:last-child{
        text-align: center;
    }
    #report button{
        margin: 0 10px;
    }
</style>
<script>
    // url에 있는 파라메터 받아오기
    $.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    return results[1] || 0;
    }   
    $(function(){
        var text = "<%=mc.getMcoContent()%>".replace(/(<br>|<br\/>|<br \/>)/g, ' ');
        $("#reportType").val(text);
        var rUser = "<%=mc.getMcoWName()%>";
        $("#reportUser").val(rUser);
    });
</script>
</head>
<body>
    <section id="report">
        <h3> 신고 </h3>
        <form action="reportComment.mo" method="POST">
            <table>
                <tr>
                    <th>신고<br>댓글</th>
                    <td><input type="text" class="form-control" readonly id="reportType"></td>
                </tr>
                <tr>
                    <th>신고 유저</th>
                    <td><input type="text" class="form-control" readonly id="reportUser"></td>
                </tr>
                <tr>
                    <td colspan="2"><br>
                    <textarea name="rContent" id="rContent" cols="30" rows="10" class="form-control" placeholder="신고 사유를 적어주세요!"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p>※ 허위신고 / 신고 기능 오 남용시 아이디 정지등의 제재 조치를<br>받을 수 있습니다.</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="button" class="btn btn-default btn-lg border">취소</button>
                        <button type="button" class="btn btn-primary btn-lg" id="submitBtn">신고</button>
                    </td>
                </tr>
            </table>
        </form>
    </section>
    <script>
        $("#submitBtn").on("click", function(){
            var text = $("#rContent").val().replace(/(\n|\r\n)/g, '<br>');
            var mcNo = <%=mc.getMcoNo()%>;
            var rWriter = $.urlParam("num");
            $("input[name=rWriter]").val(rWriter);
            var rUserNum = <%=mc.getMcoWriter()%>;
            $("input[name=rUser]").val(rUserNum);
            var type = $.urlParam("type");
            if ( text.trim().length == 0 ) {
                Swal.fire({ type: 'warning',
                    title: '신고 오류',
                    text: '신고 내용을 입력 해주세요!'
                });
                return false;
            } else if ( text.trim().length > 1000 ) {
                Swal.fire({ type: 'warning',
                    title: '신고 오류',
                    text: '신고사유는 1000자까지 등록 가능합니다!'
                });
            }
            $.ajax({
            url:"reportComment.mo",
            type: "POST",
            data: { text: text,
                    mcNo: mcNo,
                    rWriter: rWriter,
                    rUserNum: rUserNum,
                    type: type},
            error: function(e){
                console.log(e);
            },
            success: function(result){
                if ( result > 0 ) {
                    let timerInterval
                    Swal.fire({
                    title: '댓글 신고 완료!',
                    html: '댓글이 신고 되었습니다',
                    timer: 1000,
                    onBeforeOpen: () => {
                        // Swal.showLoading()
                        timerInterval = setInterval(() => {
                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                    }
                    }).then((result) => {
                    if (
                        result.dismiss === Swal.DismissReason.timer
                    ) {
                        opener.location.href="javascript:loadComment();"
                        if (opener!= null) {
                            opener.updateForm = null;
                            self.close();
                        }
                    }
                    });
                } else {
                    Swal.fire({ type: 'error',
                    title: '신고 오류',
                    text: '댓글 신고가 실패하였습니다!'
                    });
                }
            }

        });
        });
    </script>
</body>
</html>