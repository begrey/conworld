중콘나라 기능 테스트 방법!


(1). 회원가입
	로그인을 하지 않았을 시, index에는 로그인과 회원가입 버튼만 보인다. 따라서 상품을 작성하거나 보기 위해서는 로그인이 필요
	master 아이디는 mushroom이다 (비번도 mushroom이고, 모든 값이 다 mushroom이다)
	회원가입 시 제약조건 넣어둠
	회원가입 성공 시 로그인 페이지로 이동
(2). 로그인
	로그인 성공 시 index 페이지에는 해당 'id'님 환영합니다! 라는 메세지와 함께 로그인 세션이 생성되어 유지된다.
	따라서 로그인시 세션 성공으로 index 페이지로 으로 이동하게 된다.
	세션이 유지되는 동안에는 index에서 글쓰기와 상품정보 확인이 가능하다.
	로그아웃 누를시 세션이 사라지며 로그인 페이지로 다시 이동한다.
(3). 상품 보기
	상품정보를 누르면 사람들이 최신순으로 작성한 게시물들이 리스트로 나열된다. 해당 게시물의 이름을 누르면 view.jsp를 통해 게시물의 자세한 정보가 나온다.
	이떄, 자신이 작성한 게시물인 경우에만 삭제, 수정이 보이게 된다. 자세한 내용에는 판매자의 카카오톡 id가 user와 post의 조인을 통해 명시되어 있으므로 해당 id를 이용하여
	판매자와 1:1로 구매를 진행한다
(4). 상품 판매글 작성
	판매글을 작성 시, 가격과 상품이름이 공백일 경우 경고문을 띄워 제약조건을 걸어두었다
	또한 만료일을 현재 날짜보다 과거로 클릭할 시 경고문을 띄워 방지한다. (이미 만료된 상품은 팔 수 없기 때문에!)
	카테고리를 고를 시, selected된 ---카테고리---와 같이 의미없는 내용을 고를 시에도 선택하라고 경고문을 띄운다
	카테고리를 맞게 골라도, 해당 브랜드를 제대로 고르지 않으면 경고문이 뜬다. (ex. ---편의점가게--- 등)
	직접 테스트 하실 때 제약조건이 잘 돌아가는지 확인하실수 있습니다! 
(5) 생성된 상품 확인
	만료일을 입력한 후, post 테이블에는 sysdate와 비교하여 해당 기프티콘의 남은 기간을 저장해둔다.
	남은기간(period)를 기준으로 list.jsp에서는 
	일주일 초과 -> 원가의 80프로
	일주일 이하 -> 원가의 70프로
	당일 -> 당일특가 표시 및 반값!
(6) 상품게시글 수정
	만료일을 수정하면 남은 기간도 그에 맞춰 바뀝니다!

	
	