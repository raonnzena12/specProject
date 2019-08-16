<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mobile.model.vo.*"%>
<%
    MobileComment mc = (MobileComment)request.getAttribute("mc");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
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
<script>
    $(function(){
        var text = "<%=mc.getMcoContent()%>".replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
        $("#commCon").val(text).focus();
    })
    function updateComment(){
        var text = $("#commCon").val().replace(/(\n|\r\n)/g, '<br>');
        var mcNo = <%=mc.getMcoNo()%>;
        if ( text.trim().length == 0 ) {
            Swal.fire({ type: 'warning',
                title: '등록 오류',
                text: '댓글 내용을 입력 해주세요!'
            });
            return false;
        } else if ( text.trim().length > 1000 ) {
            Swal.fire({ type: 'warning',
                title: '등록 오류',
                text: '댓글은 1000자까지 등록 가능합니다!'
            });
        }

        $.ajax({
            url:"modifyComment.mo",
            type: "POST",
            data: { text: text,
                    mcNo: mcNo,
                    type: 2},
            error: function(e){
                console.log(e);
            },
            success: function(result){
                if ( result > 0 ) {
                    let timerInterval
                    Swal.fire({
                    title: '댓글 수정 성공!',
                    html: '댓글 수정에 성공하였습니다',
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
                    title: '수정 오류',
                    text: '댓글 수정에 실패하였습니다!'
                    });
                }
            }

        });
    }
</script>
<style>
    * {
        font-size: 14px;
        font-family: 'Noto Sans KR';
        box-sizing: border-box;
    }
    #commWriteA {
        margin: 10px;
        padding: 10px;
    }
    h3 {
        text-align: center;
        margin: 20px;
    }
</style>
</head>
<body>  
    <h3>댓글 수정</h3>
    <div class="commWriteA input-group mb-3 border" id="commWriteA">
        <textarea name="commCon" id="commCon" rows="3" class="form-control" aria-describedby="button-addon2"placeholder="댓글을 입력해주세요"></textarea>
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="updateComment();">댓글<br>수정</button>
        </div>
    </div>
</body>
</html>