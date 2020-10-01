$(document).ready(() => {
  $('.menu-container').slideUp(0)
  setTimeout(() => {
    $('.flash-container').fadeOut(1000)
  }, 1000)
})


$('#menu-popper').click(() => {
  $('.menu-container').slideToggle()
  $('#menu-bar1').toggleClass('changed-top')
  $('#menu-bar3').toggleClass('changed-bot')
  $('#menu-bar2').fadeToggle(40)
})