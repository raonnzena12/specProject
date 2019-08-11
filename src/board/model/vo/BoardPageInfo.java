package board.model.vo;

public class BoardPageInfo {
	
	private int BoardCount;
	private int limit;
	private int PageingBarSize;
	private int currentPage;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public BoardPageInfo() {
		
	}

	public BoardPageInfo(int boardCount, int limit, int pageingBarSize, int currentPage, int maxPage, int startPage,
			int endPage) {
		super();
		BoardCount = boardCount;
		this.limit = limit;
		PageingBarSize = pageingBarSize;
		this.currentPage = currentPage;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getBoardCount() {
		return BoardCount;
	}

	public void setBoardCount(int boardCount) {
		BoardCount = boardCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getPageingBarSize() {
		return PageingBarSize;
	}

	public void setPageingBarSize(int pageingBarSize) {
		PageingBarSize = pageingBarSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "BoardPageInfo [BoardCount=" + BoardCount + ", limit=" + limit + ", PageingBarSize=" + PageingBarSize
				+ ", currentPage=" + currentPage + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
	
	
	
	

}
