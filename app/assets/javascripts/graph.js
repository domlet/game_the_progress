

function draw(data) {
    // Pulls data array out of object
    // data.data =[
    //   {name: "name1", value: 0.8},
    //   {name: "name2", value: 0.3},
    //   {name: "name3", value: 0.2},
    //   {name: "name4", value: 0.6},
    //   {name: "name5", value: 0.1},
    //   {name: "name6", value: 0.7}
    // ]

    data = data.data
    // data = data.data.map((ele)=>{return ele.value})

    // data = [1,2,3,4,5]

    // Take
    console.log(data);
    var width = 420,
        barHeight = 20;

    var xGenerate = d3.scaleLinear()
        .domain([0, 10])
        .range([0, width]);

    var chart = d3.select("svg")
        .attr("width", width)

    var bar = chart.selectAll("g")
        .data(data)
        .enter().append("g")
        .attr("transform", function (d, i) {
                  // d = d.value
                  console.log("******", d)
                  // d = d.forEach(function(ele){
                  //   return ele.value
                  // })

                  return "translate(0," + i * barHeight + ")";
                  // return "translate(0, 20)";
              }.apply({}, data.map((ele)=>{return ele.value})));

    bar.append("rect")
        .attr("width", xGenerate)
        .attr("height", barHeight - 1)
        .style("fill", "green")

    // bar.append("text")
    //     .attr("x", function (d) {
    //       console.log("inside appending x", d)
    //               return xGenerate(d.value) - 10;
    //           })
    //     .attr("y", barHeight / 2)
    //     .attr("dy", ".35em")
    //     .style("fill", "white")
        // .text(function (d) {
        //           return d.name;
        //       });
}



















