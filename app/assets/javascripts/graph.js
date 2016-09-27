

function draw(data) {
    // Pulls data array out of object
    var data = data.data;
    // data = [
    //          {label: "name1", value: 8},
    //          {label: "name2", value: 3},
    //          {label: "name3", value: 2},
    //          {label: "name4", value: 6},
    //          {label: "name5", value: 1},
    //          {label: "name6", value: 7}
    //        ]


    var div = d3.select("body").append("div").attr("class", "toolTip");

    var axisMargin = 20,
            margin = 40,
            valueMargin = 4,
            width = parseInt(d3.select('body').style('width'), 10),
            height = parseInt(d3.select('body').style('height'), 10),
            barHeight = (height-axisMargin-margin*2)* 0.4/data.length,
            barPadding = (height-axisMargin-margin*2)*0.6/data.length,
            data, bar, svg, scale, xAxis, labelWidth = 0;

    max = d3.max(data, function(d) { return d.value; });

    svg = d3.select('body')
            .append("svg")
            .attr("width", width)
            .attr("height", height);


    bar = svg.selectAll("g")
            .data(data)
            .enter()
            .append("g");

    bar.attr("class", "bar")
            .attr("cx",0)
            .attr("transform", function(d, i) {
                return "translate(" + margin + "," + (i * (barHeight + barPadding) + barPadding) + ")";
            });

    bar.append("text")
            .attr("class", "label")
            .attr("y", barHeight / 2)
            .attr("dy", ".35em") //vertical align middle
            .text(function(d){
                return d.label;
            }).each(function() {
        labelWidth = Math.ceil(Math.max(labelWidth, this.getBBox().width));
    });

    scale = d3.scale.linear()
            .domain([0, max])
            .range([0, width - margin*2 - labelWidth]);

    xAxis = d3.svg.axis()
            .scale(scale)
            .tickSize(-height + 2*margin + axisMargin)
            .orient("bottom");

    bar.append("rect")
            .attr("transform", "translate("+labelWidth+", 0)")
            .attr("height", barHeight)
            .attr("width", function(d){
                return scale(d.value);
            });

    bar.append("text")
            .attr("class", "value")
            .attr("y", barHeight / 2)
            .attr("dx", -valueMargin + labelWidth) //margin right
            .attr("dy", ".35em") //vertical align middle
            .attr("text-anchor", "end")
            .text(function(d){
                return (d.value+"%");
            })
            .attr("x", function(d){
                var width = this.getBBox().width;
                return Math.max(width + valueMargin, scale(d.value));
            });

    bar
            .on("mousemove", function(d){
                div.style("left", d3.event.pageX+10+"px");
                div.style("top", d3.event.pageY-25+"px");
                div.style("display", "inline-block");
                div.html((d.label)+"<br>"+(d.value)+"%");
            });
    bar
            .on("mouseout", function(d){
                div.style("display", "none");
            });

    bar
            .on("click", function(d){
              // alert('SAY WHAAAT user id:')
              console.log('User info on the row', d)
              console.log('URL', window.location.origin  )
              var url = window.location.origin + '/graph/student/' + d.id;
              window.location = url;
            });

    svg.insert("g",":first-child")
            .attr("class", "axisHorizontal")
            .attr("transform", "translate(" + (margin + labelWidth) + ","+ (height - axisMargin - margin)+")")
            .call(xAxis);
}

    // data = data.data
    // // data = data.data.map((ele)=>{return ele.value})

    // // data = [1,2,3,4,5]

    // // Take
    // console.log(data);
    // var width = 420,
    //     barHeight = 20;

    // var xGenerate = d3.scaleLinear()
    //     .domain([0, 10])
    //     .range([0, width]);

    // var chart = d3.select("svg")
    //     .attr("width", width)

    // var bar = chart.selectAll("g")
    //     .data(data)
    //     .enter().append("g")
    //     .attr("transform", function (d, i) {
    //               // d = d.value
    //               console.log("******", d)
    //               // d = d.forEach(function(ele){
    //               //   return ele.value
    //               // })

    //               return "translate(0," + i * barHeight + ")";
    //               // return "translate(0, 20)";
    //           }.apply({}, data.map((ele)=>{return ele.value})));

    // bar.append("rect")
    //     .attr("width", xGenerate)
    //     .attr("height", barHeight - 1)
    //     .style("fill", "green")

    // // bar.append("text")
    // //     .attr("x", function (d) {
    // //       console.log("inside appending x", d)
    // //               return xGenerate(d.value) - 10;
    // //           })
    // //     .attr("y", barHeight / 2)
    // //     .attr("dy", ".35em")
    // //     .style("fill", "white")
    //     // .text(function (d) {
    //     //           return d.name;
    //     //       });


















