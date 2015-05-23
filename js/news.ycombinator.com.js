// // https://gist.github.com/8aa2f590dcd0cdd7179f

// (function(){
  
// var current = 0;
// var nl = document.querySelectorAll("center > table tr table tr");
// for(i = 5; i < nl.length-1; i++){
//   var e = nl[i];
//   if(e.querySelectorAll("img")[0].getAttribute("width") === "0"){
//     current++;
//     (function(c, parent){
//     parent.setAttribute("class", "parent-"+current);
//     parent.addEventListener('click',function (ev) {
//       var children = document.querySelectorAll(".child-"+c);
//       if(children.length > 0){
//       if(children[0].style.display == "none"){
//         newdisplay = "block";
//         }else{
//         newdisplay = "none";
//         }
//       }
//       for(var j = 0; j < children.length; j++){
//         children[j].style.display = newdisplay;
//       }
//       ev.preventDefault();
//     },false);
//     })(current, e);
//   }
//   else{ 
//     e.setAttribute("class", "child-"+current); 
//   }
// }
// })()
