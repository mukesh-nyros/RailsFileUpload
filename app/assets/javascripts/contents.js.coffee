# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->  
  $("#success").hide()
  $("#sample").hide()
  $("#sam").hide()
  $("#s1").show()
  $("#email-attach").hide()
  $("#b1").bind "ajax:success", (evt, data, status, xhr) ->
    $("#sam").hide()
    $("#s1").show()
    return
  $("a.delete_data").click ->
    r = confirm("Are you sure?")
    if r is false
      return false
    else
      $.ajax
        url: root_path
        type: "DELETE" 
      return 
  $("#last a").bind "ajax:success", (evt, data, status, xhr) ->
    $("#notice").hide()
    return
  $("#s1 a").click ->
    $("#s1").hide()
    $("#sam").show()
    return
  $("td.lightbox a").click ->
    $("#sample").show()
    $("#email-attach").show()
    $("#one").hide()
    ref = $(this).find("img").attr("alt")
    $("#attach").attr("value",ref)
    type1 = /^.*\.(jpg|png|gif|bmp|BMP|jpeg|JPG|PNG|GIF|JPEG)$/
    type2 = /^.*\.(pdf|PDF)$/
    if type1.test(ref)  
      $("#box").append "<img src=\"" + ref + "\", width='300' height='300'>"
    else if type2.test(ref)
      $("#box").hide()
      $("#lightboxes").append "<div id=\"reader\" >" + "</div>"
      $("#reader").append "<embed type='application/pdf' src='" + ref + "' width='720' height='320' >"
    else
      $("#box").append "<iframe src=\"http://docs.google.com/viewer?embedded=true&url=" + encodeURIComponent("http://localhost:3000" + ref) + "\" width=\"300\" height=\"300\" style=\"border: none;margin : 0 auto; display : block;\"></iframe>"
    return  
  $("#lightboxes a").click ->
    $("#sample").hide()
    $("#email-attach").hide()
    $.get "/uploads/", (data) ->
     $("tr").val data
    return
    return
  $('#em').blur ->
    $(this).next("p").remove()
    em1 = $(this).val()
    regex=///^[A-Za-z0-9_.]*@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$///
    if !regex.test(em1)
      $(this).focus()
      $(this).after("<p>Email pattern {abc_123@gmail.com}</p>")
      $(this).css("border","2px solid red")
      $("p").css("color","red");
    else
      $(this).css("border","1px solid grey")
    return
    return
  $("#sub").click ->
    p1 = $("#em").val()
    regex=///^[A-Za-z0-9_.]*@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$///
    if p1 is ""
     $("#em").focus()
    else if !regex.test(p1)
     $("#em").focus()
     $(this).select()
    else
     $("#email-attach").hide() 
     $("#load").show()
    return
    return
  
