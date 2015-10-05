var LAYER_NAME_REGEXP = /^([0-9]+) .*$/;

var doc = app.activeDocument;
var layers = doc.layers;

var character = {
    HAIR_LAYERS: [0, 13],
    
    
    iterateLayers: function iterateLayers(action, layerNumber){
        var i, j; //index in layer and sublayer arrays
        var x, y; //number in layer's name, and sublayer's name respectively
        var matches; //used to temporarily store matches in layer name
        
        for(
            i = 0;
            typeof layerNumber == "number" ?
                  i == layerNumber
                : i < layers.length;
            i++
        ){
            if(!(matches = layers[i].name.match(LAYER_NAME_REGEXP))) continue;
            x = Number(matches[0]);
            
            action(layers[i], x);
            
            for(j = 0; j < layers[i].layers.length; j++){
                if(!(matches = layers[i].layers[j].name.match(LAYER_NAME_REGEXP))) continue;
                y = Number(matches[0]);
                
                action(layers[i].layers[j], x, y);
            }
        }
    },
    
    hideAllLayers: function hideAllLayers(){
        this.iterateLayers(function(layer, x){
            layer.visible = false;
        });
    },
    
    showDefaultLayers: function showDefaultLayers(){
        this.iterateLayers(function(layer, x, y){
            var isRootLayer = !(typeof y == "number");
            
            if(isRootLayer || y == 0) layer.visible = true;
        });
    },

    setHair: function setHair(number){
        //Show hairstyle sublayers with matching number,
        //otherwise fall back to showing default sublayers
        //(default sublayers are numbered 0)
        for(var i = 0; i < this.HAIR_LAYERS.length; i++){
            var defaultLayers = [];
            var found = false;
            
            //Hide all sublayers except ones specified
            this.iterateLayers(function(layer, x, y){
                if(typeof y != "number") return;
                if(y == 0) defaultLayers.push(layer);                
                if(y == number){
                    found = true;
                    layer.visible = true;
                }else layer.visible = false;
            }, this.HAIR_LAYERS[i]);
            
            //Fall back to default sublayers if specified ones not found
            if(!found) for(var j = 0; j < defaultLayers.length; j++){
                layer.visible = true;
            };
        }
    }
};

character.hideAllLayers();
character.showDefaultLayers();
character.setHair(1);
