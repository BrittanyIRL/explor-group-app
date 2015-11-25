
var cities = ["Seattle", "Beijing", "Paris", "London", "Tokyo"]


$(document).ready(function() {
    

    //full page JS functions for landing and results 
    $('#landing').fullpage({
        //Navigation
        //menu: '#menu',
        lockAnchors: false,
        anchors: ['explor', 'about', 'developers'],
        navigation: false,
        navigationPosition: 'right',
        navigationTooltips: ['Start Exploring', 'About Explor', 'The Team'],
        showActiveTooltip: true,
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
        resize : false, //this shrinks text on viewport size change
        sectionsColor : ['rgba(162, 222, 208,0.6)', '#FEB41C', '#5E7C88'],
        paddingTop: '50px',
        paddingBottom: '50px',
        fixedElements: '#header, .footer, nav',
        responsiveWidth: 800,
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
        anchors: ['weather', 'dining', 'arts', 'nightlife'],
        navigation: true,
        navigationPosition: 'right',
        /* navigationTooltips: ['Weather', "Food and Drink", "Arts & Culture", "Nightlife" ], */
        showActiveTooltip: false,
        slidesNavigation: true,
        slidesNavPosition: 'bottom',

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
        resize : false,
        sectionsColor : [],
        paddingTop: '50px',
        paddingBottom: '50px',
        fixedElements: 'footer, nav',
        responsiveWidth: 600,
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
