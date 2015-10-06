var LAYER_NAME_REGEXP = /^([0-9]+) .*$/;

var doc = app.activeDocument;
var layers = doc.layers;

function isArray(obj){
    if(typeof obj != "object") return false;
    if(!("length" in obj)) return false;
    if(typeof obj.length != "number") return false;
    
    return true;
}

var character = {
    iterateLayers: function iterateLayers(action, layerNumbers, sublayerNumbers){
        var i, j; //index in layer and sublayer arrays
        var x, y; //number in layer's name, and sublayer's name respectively
        var layerMap = null, sublayerMap = null; //hashmaps of filters
        var matches; //used to temporarily store matches in layer name
        
        //Convert values in filter arrays to keys in filter maps for efficiency
        if(isArray(layerNumbers)){
            layerMap = {};
            for(var n = 0; n < layerNumbers.length; n++) layerMap[layerNumbers[n]] = true;
        }
        if(isArray(sublayerNumbers)){
            sublayerMap = {};
            for(var n = 0; n < sublayerNumbers.length; n++) sublayerMap[sublayerNumbers[n]] = true;
        }
        
        for(i = 0; i < layers.length; i++){
            if(!(matches = layers[i].name.match(LAYER_NAME_REGEXP))) continue;
            x = Number(matches[0]);
            if(layerMap && !layerMap[x]) continue;
            
            action(layers[i], x);
            
            for(j = 0; j < layers[i].layers.length; j++){
                if(!(matches = layers[i].layers[j].name.match(LAYER_NAME_REGEXP))) continue;
                y = Number(matches[0]);
                if(sublayerMap && !sublayerMap[y]) continue;
                
                action(layers[i].layers[j], x, y);
            }
        }
    },
    
    hideAllLayers: function hideAllLayers(){
        this.iterateLayers(function(layer, x, y){
            if(typeof y != "number") layer.visible = false;
        });
    },

    hideAllSublayers: function hideAllSublayers(){
        this.iterateLayers(function(layer, x, y){
            layer.visible = false;
        });
    },
    
    showAllLayers: function showAllLayers(){
        this.iterateLayers(function(layer, x, y){
            if(typeof y != "number") layer.visible = true;
        });
    },

    selectLayers: function selectLayers(layerNumbers){
        layerMap = {};
        
        if(!isArray(layerNumbers)) return;
        for(var n = 0; n < layerNumbers.length; n++) layerMap[layerNumbers[n]] = true;
        
        this.iterateLayers(function(layer, x, y){
            if(typeof y == "number") return; 
            
            if(layerMap[x]) layer.visible = true;
            else layer.visible = false;
        });
    },
    
    selectSublayers: function selectSublayers(layerNumbers, sublayerNumbers, noDefault){
        var sublayerMap = {};
        
        //Convert values in filter arrays to keys in filter maps for efficiency
        if(!isArray(layerNumbers)) return;
        if(!isArray(sublayerNumbers)) return;
        for(var n = 0; n < sublayerNumbers.length; n++) sublayerMap[sublayerNumbers[n]] = true;
        
        //Show sublayers with matching number,
        //otherwise fall back to showing default sublayers
        //(default sublayers are numbered 0)
        for(var i = 0; i < layerNumbers.length; i++){
            var defaultLayers = [];
            var found = false || noDefault;
            
            this.iterateLayers(function(layer, x, y){
                if(typeof y != "number") return;
                if(y == 0) defaultLayers.push(layer);   
                
                if(sublayerMap[y]){
                    found = true;
                    layer.visible = true;
                }else layer.visible = false;
            }, [layerNumbers[i]]);
            
            //Fall back to default sublayers if specified ones not found
            if(!found) for(var j = 0; j < defaultLayers.length; j++){
                defaultLayers[j].visible = true;
            };
        }
    },

    exportPng: function exportPng(dest){
        var file = new File(dest);
        options = new ImageCaptureOptions();
        options.resolution = 72;
        options.antiAliasing = true;
        options.transparency = true;
        doc.imageCapture(file, doc.artboards[0].artboardRect, options);
    },

    exportEachLayer: function exportEachLayer(){
        var exportRoot = doc.path.selectDlg();
        var exportFolder = null;
        var previousLayer = null, previousSublayer = null;
        
        this.hideAllSublayers();
        
        this.iterateLayers(function(layer, x, y){
            layer.visible = true;
            
            if(typeof y != "number"){
                if(previousLayer) previousLayer.visible = false;
                previousLayer = layer;
                exportFolder = new Folder(exportRoot + "/" + layer.name);
                if(!exportFolder.exists) exportFolder.create();
            }else{
                if(previousSublayer) previousSublayer.visible = false;
                previousSublayer = layer;
                
                character.exportPng(exportFolder + "/" + layer.name + ".png");
            }
        });
    }
};

//character.exportEachLayer();

character.showAllLayers();

//Set hairstyle
character.selectSublayers([0, 13], [0]);

//Set eyelashes
character.selectSublayers([11], [0]);

//Set expression
character.selectSublayers([8, 9, 10, 12], [0]);

//Set head shape
character.selectSublayers([7], [1]);

//Set clothing
character.selectSublayers([1, 6], [3, 4]);

//Set body and limbs
character.selectSublayers([2, 3, 5], []);

