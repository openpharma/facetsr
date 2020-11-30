/*********************************************************************/
/* facetsr                                                            */
/* Explore data in R using htmlwidgets and facets                    */
/*********************************************************************/

HTMLWidgets.widget({

  name : 'facetsr',
  type : 'output',

  factory : function(el, width, height) {

    let elementId = el.id
    let container = document.getElementById(elementId)

    return {

      renderValue: function(x) {
        let el_id = `${elementId}_canva`
        let ui = `<${x.type} id='${el_id}' height='${x.height}' />`
        el.innerHTML = ui

        // Load data
        if (x.type === "facets-dive")
          document.querySelector(`#${el_id}`).data = x.json
        else if (x.type === "facets-overview") {
          proto = document.querySelector(`#${el_id}`).getStatsProto(x.json)
          document.querySelector(`#${el_id}`).protoInput = proto
        }

      },

      resize : function(width, height) {
        // resize function is not needed
      }
    };
  }
});
