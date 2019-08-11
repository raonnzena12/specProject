<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    int size = 0;
%>
<!DOCTYPE html>
<html>
<head>
<style>
    .comment>.borderLine, .comment .commWriteA {
        border: 1px solid #aaa;
        border-radius: 4px;
        padding: 1px 10px;
        font-size: 11px;
        font-weight: bold;
        background-color: #eee;
        margin: 20px 0;
    }
    .commentArea .userName {
        font-weight: bolder;
        margin: 0 10px;
    }
    .commentArea span {
        display: inline-block;
    }
    .userInfo>.date, .userInfo a {
        font-size: 11px;
        color: #666;
    }
    .userInfo>.control {
        float: right;
        margin: 0 10px;
    }
    .commCon {
        margin: 2px 15px;
    }
    .commentArea hr {
        margin: 10px 0;
    }
    #commWriteA {
        padding: 5px 10px;
    }
    .commentArea a {
        margin-left: 7px;
        cursor: pointer;
    }
    .commentArea .myComment{
        color: dodgerblue;
    }
    #commCon {
        resize: none;
    }
    /* 커스텀 컨펌버튼 속 버튼 마진 */
    .swal2-confirm.btn.btn-primary { 
        margin-left: 10px;
    }
</style>
<script>
    // 페이지 로딩시 코멘트 로딩 함수 한번 호출
    loadComment();
    // 코멘트 로딩 함수
    function loadComment(){
        var mno = <%=mo.getmNo()%>;

        $.ajax({
            url: "commentLoad.mo",
            type: "POST",
            data: { mno : mno },
            dataType: "json",
            error: function(e){
                console.log(e);
            },
            success: function(cList){
                printComment(cList);
            }
        });
    }
    // 코멘트 등록 함수
    function writeComment(){
        var mno = <%=mo.getmNo()%>;
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //////// 회원번호 지금은 없으니 임시 변수 넣어둠...!! 수정필요!!!!!!!!!!!!!!!!!!!!!!!!!!1///////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        <%if ( loginUser != null ) {%>var writer = <%=loginUser.getUserNo()%>;<%}%>
        var commCon = $("#commCon").val();
        if ( commCon.trim().length == 0 ) {
            Swal.fire({ type: 'warning',
                title: '등록 오류',
                text: '댓글 내용을 입력 해주세요!'
            });
            return false;
        } else if ( commCon.trim().length > 1000 ) {
            Swal.fire({ type: 'warning',
                title: '등록 오류',
                text: '댓글은 1000자까지 등록 가능합니다!'
            });
        }

        $.ajax({
            url: "commentInsert.mo",
            data: { mno: mno,
                    writer: writer,
                    commCon: commCon },
            type: "POST",
            error: function(e){
                console.log(e);
            },
            success: function(result){
                if ( result > 0 ) { //댓글 등록이 성공했을 경우
                    $("#commCon").val("");
                    loadComment();
                } else {
                    Swal.fire({
                    type: 'error',
                    title: 'Oops...',
                    text: '댓글등록에 실패했습니다!'
                    // footer: '<a href>Why do I have this issue?</a>'
                    });
                }
            }
        });

    }
    // 코멘트 삭제 함수
    function deleteComment(id){
        $.ajax({
            url: "commentDelete.mo",
            type: "POST",
            data: { mcNo: id},
            error: function(e){
                console.log(e);
            },
            success: function(result){
                if ( result > 0 ) {
                    Swal.fire(
                    '삭제 성공!',
                    '댓글이 성공적으로 삭제 되었습니다!',
                    'success'
                    );
                    loadComment();
                } else {
                    Swal.fire({
                    type: 'error',
                    title: 'Oops...',
                    text: '댓글삭제에 실패했습니다!'
                    // footer: '<a href>Why do I have this issue?</a>'
                    });
                }
            }
        });

    }
    // 코멘트 수정창 호출 함수
    function updateComment(id) {
        window.open("modifyComment.mo?mcNo="+id, "updateForm", "width=800px, height=300px, resizable = no, scrollbars = no");
    }
    // 코멘트 프린트 함수
    function printComment(cList){
        var userNo = 0;
        // 유저login 확인 가능한 즉시
        <% if( loginUser != null ) { %> userNo = <%=loginUser.getUserNo()%>;<% } %>
        var listSize = Object.keys(cList).length; 
        var $commentArea = $(".commentArea");
        $commentArea.html("");
        var $commEA = $("<div>").addClass("commEA");
        if ( listSize == 0 ) { // 넘어온 리스트의 사이즈가 0일떄 ( 댓글이 없을때 출력 )
            var $noneP = $("<p>").addClass("noneP").text("등록된 댓글이 없습니다.");
            $commEA.append($noneP);
            $commentArea.append($commEA);
        } else { // 넘어온 리스트의 사이즈가 0이 아닐 떄 (댓글이 있을떄 출력)
            $.each(cList, function(i){
                var $userInfo = $("<div>").addClass("userInfo");
                var $userName = $("<span>").addClass("userName").text(cList[i].mcoWName);
                if ( <%=loginUser != null %> && cList[i].mcoWriter == userNo ) { // 내 댓글일 경우 클래스 추가 ( 이름 색 변경용 )
                    $userName.addClass("myComment");
                } 
                var $date = $("<span>").addClass("date");
                if ( cList[i].mcoStatus == "2" || cList[i].mcoStatus == "3" ) {
                    // 댓글이 삭제/혹은 신고로 의한 제재 상태일 경우 수정일을 저장한다
                    $date.text(cList[i].mcoModiDate);
                } else {
                    // 댓글이 일반 상태일 경우 등록일을 저장한다.
                    $date.text(cList[i].mcoRegDate);
                }
                var $control = $("<span>").addClass("control").attr("id",cList[i].mcoNo);
                var $report = $("<a>").addClass("reportComm").text("신고");
                var $modify = $("<a>").addClass("modifyComm").text("수정");
                var $delete = $("<a>").addClass("deleteComm").text("삭제");
                if ( <%=loginUser == null%> || cList[i].mcoStatus == 2 || cList[i].mcoStatus == 3 ){
                    // 댓글이 삭제/ 혹은 신고로 의한 제재 상태일 경우 아무버튼도 노출하지 않는다
                } 
                else if ( cList[i].mcoWriter == userNo ) { // 내 댓글일 경우 수정 / 삭제 출력
                    $control.append($modify, $delete);
                } else { // 내 댓글이 아닐 경우 신고 출력
                    $control.append($report);
                }
                var $commCon = $("<div>").addClass("commCon");
                if ( cList[i].mcoStatus == 2 ) {
                    // 유저에 의하여 삭제된 댓글일 경우 출력글
                    $commCon.text("유저에 의하여 삭제된 댓글입니다.");
                } else if ( cList[i].mcoStatus == 3 ) {
                    // 신고 누적으로 제재당한 댓글일 경우 출력글
                    $commCon.text("신고 누적으로 운영자에 의하여 삭제된 댓글입니다.");
                } else {
                    // 일반 상태일 경우 댓글내용을 출력
                    $commCon.html(cList[i].mcoContent);
                }
                var $hr = $("<hr>");
                $userInfo.append($userName, $date, $control);
                $commEA.append($userInfo, $commCon, $hr);
                $commentArea.append($commEA);
            });
        }
    }
</script>
</head>
<body>
    <section class="comment">
        <div class="borderLine">
            <span class="count"> Comments</span>
        </div>
        <div class="commentArea">
            <!-- <% if (true) { %>
                <% for ( int i = 0 ; i < size ; i++ ) { %>
                    <div class="commEA">
                        <div class="userInfo">
                            <span class="userName">유저<%=i+1%></span><span class="date">2019.07.28 11:10</span><span class="control"><a href="#">신고</a></span>
                        </div>
                        <div class="commCon"><%=i+1%>번째 코멘트</div>
                        <hr>
                    </div>
                <% } 
             } %> -->
        </div>
        <div class="reloadBtn">
            <button type="button" class="btn btn-light border text-center" onclick="loadComment();">새로운 댓글 확인</button>
        </div>
        <div class="commWriteA input-group mb-3" id="commWriteA">
            <textarea name="commCon" id="commCon" rows="3" class="form-control" aria-describedby="button-addon2"placeholder="댓글을 입력해주세요"></textarea>
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="writeComment();">댓글 입력</button>
            </div>
        </div>
    </section>
    <script>
        $(function(){
            // 댓글창 클릭시 
            $("#commCon").on("focus", function(){
                if ( <%=loginUser == null%> ) {
                    $("#commCon").blur();
                    Swal.fire({
                    type: 'warning',
                    title: '로그인이 필요합니다.',
                    text: '댓글을 쓰기 전 먼저 로그인 해 주세요!'
                    });
                }
            });
            // $.fn.insertComment = function(){

            // }
            $(document).on("click",".deleteComm", function(){
                var id = $(this).parent().attr("id");
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                    confirmButton: 'btn btn-primary',
                    cancelButton: 'btn btn-danger'
                },
                    buttonsStyling: false
                })

                swalWithBootstrapButtons.fire({
                    title: '댓글 삭제',
                    text: "해당 댓글을 삭제하시겠습니까?",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '삭제',
                    cancelButtonText: '취소',
                    reverseButtons: true
                }).then((result) => {
                if (result.value) { // 삭제버튼을 눌렀을 떄 
                    deleteComment(id)
                } 
                // else if ( 취소시 액션을 주고싶다면 이걸 만지면 될것같다
                //     /* Read more about handling dismissals below */
                //     result.dismiss === Swal.DismissReason.cancel
                // ) {
                //     swalWithBootstrapButtons.fire(
                //     'Cancelled',
                //     'Your imaginary file is safe :)',
                //     'error'
                //     )
                // }
                });
            });
            $(document).on("click",".modifyComm", function(){
                var id = $(this).parent().attr("id");
                updateComment(id);
            });
        });
    </script>
</body>
</html>