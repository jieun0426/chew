         //       memberlist.jsp 영역

                
                    //  검색값 입력시  Ajax 쏨
	
	
	function doMemberSearch() {
    var key = document.getElementById('searchKey').value;
    var val = document.getElementById('searchValue').value;
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '${pageContext.request.contextPath}/membersearch?searchKey=' + encodeURIComponent(key) + '&searchValue=' + encodeURIComponent(val));
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 결과를 테이블로 출력
            var members = JSON.parse(xhr.responseText);
            var html = '<table border="1" style="width:100%"><tr><th>아이디</th><th>이름</th><th>연락처</th><th>생년월일</th></tr>';
            if(members.length === 0){
                html += '<tr><td colspan="4">검색 결과가 없습니다.</td></tr>';
            } else {
                for(var i=0; i<members.length; i++) {
                    html += '<tr>' +
                        '<td>' + members[i].id + '</td>' +
                        '<td>' + members[i].name + '</td>' +
                        '<td>' + members[i].phone + '</td>' +
                        '<td>' + (members[i].birth ? members[i].birth.substring(0,10) : '') + '</td>' +
                        '</tr>';
                }
            }
            html += '</table>';
            document.getElementById('searchResult').innerHTML = html;
        }
    };
    xhr.send();
}


//       회원 정보 수정 및 삭제 부분

//         삭제 버튼 클릭시 alert 	

let deleteFormToSubmit = null;

document.addEventListener('DOMContentLoaded', function() {
    var deleteBtns = document.querySelectorAll('.deleteBtn');
    var deleteModal = document.getElementById('deleteModal');
    var deleteYesBtn = document.getElementById('deleteYesBtn');
    var deleteNoBtn = document.getElementById('deleteNoBtn');
    
    deleteBtns.forEach(function(btn) {
        btn.addEventListener('click', function() {
            showDeleteModal(this.closest('form'));
        });
    });

    if (deleteYesBtn) {
        deleteYesBtn.onclick = function() {
            if (deleteFormToSubmit) {
                deleteFormToSubmit.submit();
            }
            if (deleteModal) deleteModal.style.display = 'none';
        };
    }
    if (deleteNoBtn) {
        deleteNoBtn.onclick = function() {
            deleteFormToSubmit = null;
            if (deleteModal) deleteModal.style.display = 'none';
        };
    }
});

function showDeleteModal(form) {
    deleteFormToSubmit = form;
    var deleteModal = document.getElementById('deleteModal');
    if (deleteModal) deleteModal.style.display = 'block';
}

 