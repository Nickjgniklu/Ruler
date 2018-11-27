	var paper= Raphael("display","100%","100%");
    var background=paper.rect(0,0,"100%","100%");
    background.attr("fill","#444");
    background.attr("stroke","#000");
    var circle = paper.circle(getWidth()/2,getHeight()/2,60);
    circle.attr("fill","#159");
    circle.glow();
//trying to adjust circle fro mobile
    var text = paper.text(getWidth()/2,getHeight()/2,"Distance\n"+"No Data");
    text.attr({ "font-size": 40, "font-family": "\"Courier New\", Courier, monospace" });
    makeAPIcall()//make the ifrst call the rest are called on time intervals

   // createXArcs(10);
function getWidth(){
        return document.getElementById('display').offsetWidth
    }
    function getHeight(){
        return document.getElementById('display').offsetHeight
    }
    function createXArcs(x){
        for(let i =0;i<x;i++){
            window.setTimeout(createArc,i*100);
        }
    }
    function createArc(){
        let width= getWidth();
        let height = getHeight();

        let length=100;
        let depth=50;
        //place the arc in the middle of the screen
        let arc = paper.path(["M",width/2-length,height/2,"Q",width/2,height/2-depth,width/2+length,height/2,"Q",width/2,height/2-depth+20,width/2-length,height/2])
        // move the arc 200 pixel up double it in size and then delete it
        let tpath=Raphael.transformPath(arc.attr("path"),'T0,-400,S2');
        arc.animate({path:tpath},1000,function(){
                arc.remove()

        });

        arc.attr("stroke","#fff");
        arc.attr("fill","#999");
    }
	function startPolling(){
	  var intervalID = window.setInterval(makeAPIcall, 5000);
	}

    function makeAPIcall() {



                let url ="/ruler/getDistance";
                let xhr= new XMLHttpRequest();
                xhr.open('GET',url);
                xhr.responseType='text';
                xhr.onload = function (){

					text.attr({text:xhr.response});
					createXArcs(3);
                }
                xhr.send();

            }

