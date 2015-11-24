
var cities = ["Seattle", "Beijing", "Paris", "London", "Tokyo"]


$(document).ready(function() {
    

    //full page JS functions for landing and results 
    $('#landing').fullpage({
        //Navigation
        //menu: '#menu',
        lockAnchors: false,
        anchors:['explor', 'about', 'developers'],
        navigation: false,
        navigationPosition: 'right',
        navigationTooltips: ['Start Exploring', 'About Explor', 'The Team'],
        showActiveTooltip: true,
        slidesNavigation: true,
        slidesNavPosition: 'top',

        //Scrolling
        css3: true,
        scrollingSpeed: 700,
        autoScrolling: false,
        fitToSection: true,
        fitToSectionDelay: 1000,
        scrollBar: true,
        easing: 'easeInOutCubic',
        easingcss3: 'ease',
        loopBottom: false,
        loopTop: false,
        loopHorizontal: true,
        continuousVertical: false,
        normalScrollElements: '',
        scrollOverflow: true,
        touchSensitivity: 15,
        normalScrollElementTouchThreshold: 5,

        //Accessibility
        keyboardScrolling: true,
        animateAnchor: true,
        recordHistory: true,

        //Design
        controlArrows: true,
        verticalCentered: true,
        resize : false, //this shrinks text on viewport size change
        sectionsColor : ['rgba(162, 222, 208,0.6)', 'rgba(144, 198, 149, 0.6)', 'rgba(104, 195, 163, 0.6)'],
        paddingTop: '10px',
        paddingBottom: '10px',
        fixedElements: '#header, .footer, nav',
        responsiveWidth: 0,
        responsiveHeight: 0,

        //Custom selectors
        sectionSelector: '.section',
        slideSelector: '.slide',

        //events
        onLeave: function(index, nextIndex, direction){},
        afterLoad: function(anchorLink, index){},
        afterRender: function(){},
        afterResize: function(){},
        afterSlideLoad: function(anchorLink, index, slideAnchor, slideIndex){},
        onSlideLeave: function(anchorLink, index, slideIndex, direction, nextSlideIndex){}
    });

	$('#results').fullpage({
        //Navigation
        //menu: '#resultsMenu',
        lockAnchors: false,
        anchors:['main', 'dining', 'grid', 'arts', 'nightlife', "grid"],
        navigation: true,
        navigationPosition: 'right',
        navigationTooltips: ['Weather', "Popular Food and Drink", "Arts", "Nightlife", "Grid"],
        showActiveTooltip: false,
        slidesNavigation: true,
        slidesNavPosition: 'top',

        //Scrolling
        css3: true,
        scrollingSpeed: 700,
        autoScrolling: true,
        fitToSection: true,
        fitToSectionDelay: 1000,
        scrollBar: true,
        easing: 'easeInOutCubic',
        easingcss3: 'ease',
        loopBottom: false,
        loopTop: false,
        loopHorizontal: true,
        continuousVertical: false,
        normalScrollElements: '',
        scrollOverflow: false,
        touchSensitivity: 15,
        normalScrollElementTouchThreshold: 5,

        //Accessibility
        keyboardScrolling: true,
        animateAnchor: true,
        recordHistory: true,

        //Design
        controlArrows: true,
        verticalCentered: true,
        resize : false,
        sectionsColor : ['#fff', '#fff'],
        paddingTop: '20px',
        paddingBottom: '20px',
        fixedElements: 'footer, nav',
        responsiveWidth: 0,
        responsiveHeight: 0,

        //Custom selectors
        sectionSelector: '.section',
        slideSelector: '.slide',

        //events
        onLeave: function(index, nextIndex, direction){},
        afterLoad: function(anchorLink, index){},
        afterRender: function(){},
        afterResize: function(){},
        afterSlideLoad: function(anchorLink, index, slideAnchor, slideIndex){},
        onSlideLeave: function(anchorLink, index, slideIndex, direction, nextSlideIndex){}
    });

    //airport jquery
    $('.airport').airport(cities, {
        transition_speed: 1000,
        fill_space: true
    });

    //blinking cursor
    $('#autocomplete').focus();
});
