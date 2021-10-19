/**
 * 
 */
var slides = document.querySelector('.slides'),
	slide = document.querySelectorAll('.slides li'),	// 각각의 슬라이드
	currentIdx = 0,	// 현재 몇번째 슬라이드
	slideCount = slide.length,	// 슬라이드 개수
	slideWidth = 100,	// 한개의 슬라이드 크기
	slideMargin = 30	// 각 슬라이드별 마진
	prevBtn = document.querySelector('.prev'),
	nextBtn = document.querySelector('.next');
	
	makeClone();
	
function makeClone(){
	// 뒤쪽에 복사본 만들기
	for(var i=0; i<slideCount; i++){
		var cloneSlide = slide[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides.appendChild(cloneSlide);
	}
	// 앞쪽에 복사본 만들기
	for(var i=slideCount-1; i>=0; i--){
		var cloneSlide = slide[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides.prepend(cloneSlide);
	}
	
	updateWidth();
	setInitialPos();
	
	setTimeout(function(){
		slides.classList.add('animated');
	},100)
}

function updateWidth(){
	var currentSlides = document.querySelectorAll('.slides li');
	var newSlideCount = currentSlides.length;
	
	var newWidth = (slideWidth + slideMargin)*newSlideCount - slideMargin + 'px';
	slides.style.width = newWidth;
}

function setInitialPos(){
	var initialTranslateValue = -(slideWidth + slideMargin)*slideCount;
	slides.style.transform = 'translateX('+initialTranslateValue+'px)';
}

nextBtn.addEventListener('click', function(){
	moveSlide(currentIdx+1);
});
prevBtn.addEventListener('click', function(){
	moveSlide(currentIdx-1);
});

function moveSlide(num){
	slides.style.left = -num*(slideWidth + slideMargin)+'px';
	currentIdx = num;
	//console.log(currentIdx, slideCount);
	
	if(currentIdx == slideCount || currentIdx == -slideCount){
		setTimeout(function(){
			slides.classList.remove('animated');
			slides.style.left = '0px';
			currentIdx = 0;
		}, 500);
		setTimeout(function(){
			slides.classList.add('animated');
		}, 600);
	}
	
}