call("ij.Prefs.set", "global.barPath","");
call("ij.Prefs.set", "global.barPath","/plugins/ActionBar/Meiosis/Meiosis_bar206.ijm");
bar_name=replace(substring(call("ij.Prefs.get", "global.barPath",""), lastIndexOf(call("ij.Prefs.get", "global.barPath",""),"/")+1, lastIndexOf(call("ij.Prefs.get", "global.barPath",""), ".ijm")),"_"," ");
if(isOpen(bar_name)) {
	run("Close AB", bar_name);
}
call("ij.Prefs.set", "global.defaultRoiGroup",-1);
call("ij.Prefs.set", "global.defaultRoiGroup",255);
run("Roi Defaults...", "color=orange stroke=0 group="+parseInt(call("ij.Prefs.get", "global.defaultRoiGroup",-1))+"");
// ROI groups : 
// individual foci (maximum)
// 1: main region of interest (either user-defined or from nucleus threshold
// 2: individual foci (particle)
// 3: raw axis ROI
// 4: individual axis foci (maximum)
// 5: refined, processed axis ROIs
// 6: individual axis foci (particle)
// 7: off-axis ROI (XOR of main region of interest and refined, processed axis ROI
// 8: individual off-axis foci (maximum)
// 9: axis skeletons (whole axis or synapsed/non-synapsed axis
// 10: individual off-axis foci (particle)
///// base for real foci (maxima): 9 /////
// 11: total foci (maxima)
// 13: axis foci (maxima)
// 15: off-axis foci (maxima)
// 16: individual fociA (maximum)
// 17: total fociA (maxima)
// 18: individual fociA (particle)
// 19: axis fociA (maxima)
// 20: individual axis fociA (maximum)
// 21: off-axis fociA (maxima)
// 22: individual axis fociA (particle)
// 23: total fociB (maxima)
// 24: individual off-axis fociA (maximum)
// 25: axis fociB (maxima)
// 26: individual off-axis fociA (particle)
// 27: off-axis fociB (maxima)
///// base for colocalised area around foci maxima: 23/////
// 29: colocalised area fociA maxima (area)
// 31: colocalised area axis fociA maxima (area)
// 32: individual fociB (maximum)
// 33: colocalised area off-axis fociA maxima (area)
// 34: individual fociB (particle)
// 35: colocalised area fociB maxima (area)
// 36: individual axis fociB (maximum)
// 37: colocalised area axis fociB maxima (area)
// 38: individual axis fociB (particle)
// 39: colocalised area off-axis fociB maxima (area)
// 40: individual off-axis fociB (maximum)
// 41: not colocalised area fociA (maxima)
// 42: individual off-axis fociB (maximum)
// 43: not colocalised area axis fociA (maxima)
// 45: not colocalised area off-axis fociA (maxima)
// 47: not colocalised area fociB (maxima)
// 49: not colocalised area axis fociB (maxima)
// 51: not colocalised area off-axis fociA (maxima)
///// base for random foci (maxima): 47 /////
// 53: random fociA (maxima)
// 55: random axis fociA (maxima)
// 57: random off-axis fociA (maxima)
// 59: random fociB (maxima)
// 61: random axis fociB (maxima)
// 63: random off-axis fociB (maxima)
///// base for colocalised real foci (maxima): 59 /////
// 65: fociA colocalised with fociB (maxima)
// 67: axis fociA colocalised with axis fociB (maxima)
// 69: off-axis fociA colocalised with off-axis fociB (maxima)
// 71: fociA colocalised with foci B (maxima)
// 73: axis fociA colocalised with axis foci B (maxima)
// 75: off-axis fociA colocalised with off-axis foci B (maxima)
///// base for not-colocalised real foci (maxima): 71 /////
// 77: fociA not colocalised with fociB (maxima)
// 79: axis fociA not colocalised with axis fociB (maxima)
// 80: individual fociA colocalised with fociB (maximum)
// 81: off-axis fociA not colocalised with off-axis fociB (maxima)
// 82: individual fociA colocalised with fociB (particle)
// 83: fociA not colocalised with foci B (maxima)
// 84: individual axis fociA colocalised with axis fociB (maximum)
// 85: axis fociA not colocalised with axis foci B (maxima)
// 86: individual axis fociA colocalised with axis fociB (particle)
// 87: off-axis fociA not colocalised with off-axis foci B (maxima)
// 88: individual off-axis fociA colocalised with off-axis fociB (maximum)
///// base for colocalised random foci (maxima): 83 /////
// 89: random fociA colocalised with real fociB (maxima)
// 90: individual off-axis fociA colocalised with off-axis fociB (particle)
// 91: random axis fociA colocalised with real axis fociB (maxima)
// 93: random off-axis fociA colocalised with real off-axis fociB (maxima)
// 95: random fociB colocalised with real fociA (maxima)
// 96: individual fociB colocalised with fociA (maximum)
// 97: random axis fociB colocalised with real axis fociA (maxima)
// 98: individual fociB colocalised with fociA (particle)
// 99: random off-axis fociB colocalised with real off-axis fociA (maxima)
// 100: individual axis fociB colocalised with axis fociA (maximum)
///// base for foci (particles): 101 /////
// 101: total foci (particles)
// 102: individual axis fociB colocalised with axis fociA (particle)
// 103: axis foci (particles)
// 104: individual off-axis fociB colocalised with off-axis fociA (maximum)
// 105: off-axis foci (particles)
// 106: individual off-axis fociB colocalised with off-axis fociA (particle)
// 107: total fociA (particles)
// 109: axis fociA (particles)
// 111: off-axis fociA (particles)
// 113: total fociB (particles)
// 115: axis fociB (particles)
// 117: off-axis fociB (particles)
///// base for colocalised foci (particles): 113 /////
// 119: total fociA colocalised with fociB (particles)
// 121: axis fociA colocalised with axis fociB (particles)
// 123: off-axis fociA colocalised with off-axis fociB (particles)
// 125 : total fociB colocalised with fociA (particles)
// 127: axis fociB colocalised with axis fociA (particles)
// 129: off-axis fociB colocalised with off-axis fociB (particles)
///// base for not colocalised foci (particles): 125 /////
// 131: total fociA not colocalised with fociB (particles)
// 133: axis fociA not colocalised with axis fociB (particles)
// 135: off-axis fociA not colocalised with off-axis fociB (particles)
// 137: total fociB not colocalised with fociA (particles)
// 139: axis fociB not colocalised with axis fociA (particles)
// 141: off-axis fociB not colocalised with off-axis fociA (particles)
// 144: individual fociA not colocalised withfociB (maximum)
// 146: individual fociA not colocalised withfociB (particle)
// 148: individual axis fociA not colocalised with axis fociB (maximum)
// 150: individual axis fociA not colocalised with axis fociB (particle)
// 160: individual fociB not colocalised with fociA (maximum)
// 162: individual fociB not colocalised with fociA (particle)
// 164:  individual axis fociB not colocalised with axis fociA (maximum)
// 166: individual axis fociB not colocalised with axis fociA (particle)
// 168: individual off-axis fociB not colocalised with off-axis fociA (maximum)
// 170: individual off-axis fociB not colocalised with off-axis fociA (particle)
// 255: default (will be purged from ROIManager)
call("ij.Prefs.set", "global.toolset","");
call("ij.Prefs.set", "global.toolset","meiosis");
call("ij.Prefs.set", "global.extension","");
call("ij.Prefs.set", "global.extension",".tif");
call("ij.Prefs.set", "global.version","");
call("ij.Prefs.set", "global.version","v2.06");
call("ij.Prefs.set", "global.debugMode", false);
call("ij.Prefs.set", "global.advancedUserMode",false);
call("ij.Prefs.set", "global.tool","");
call("ij.Prefs.set", "global.drawingMode","");
call("ij.Prefs.set", "global.drawingMode","freehand");
call("ij.Prefs.set", "global.magicWandMode","");
call("ij.Prefs.set", "global.magicWandMode","Legacy");
call("ij.Prefs.set", "global.magicWandTolerance",-1);
call("ij.Prefs.set", "global.magicWandTolerance",100);
call("ij.Prefs.set", "global.showWarningMessages", false);
call("ij.Prefs.set", "global.channelTestPassed", false);
call("ij.Prefs.set", "global.showAllThresholdMethods",false);
call("ij.Prefs.set", "global.showMeanValues", false);
call("ij.Prefs.set", "global.showIntDenValues", false);
call("ij.Prefs.set", "global.showIntDenValues", true);
call("ij.Prefs.set", "global.showRoughValues", false);
call("ij.Prefs.set", "global.showFineValues", false);
call("ij.Prefs.set", "global.showFineValues", true);
call("ij.Prefs.set","global.showAxesValues", false);
call("ij.Prefs.set","global.showFociValues", false);
call("ij.Prefs.set", "global.showReferenceRoiValues",false);
call("ij.Prefs.set", "global.showReferenceRoiValues",true);
call("ij.Prefs.set", "global.channelErrorMessageShown", false);
call("ij.Prefs.set", "global.pValueErrorMessageShown", false);
call("ij.Prefs.set", "global.maxRandomDistributionToShow",-1);
call("ij.Prefs.set", "global.maxRandomDistributionToShow",3);
call("ij.Prefs.set", "global.showMaximumValues", false);
call("ij.Prefs.set", "global.showMaximumValues", true);
call("ij.Prefs.set", "global.showParticleValues", false);
call("ij.Prefs.set", "global.showParticleValues", true);
call("ij.Prefs.set", "global.showIndividualFoci", false);
// processedFolder : folder where individual processed nucleus images are stored
call("ij.Prefs.set", "global.processedFolder","");
// inputFolder : processed where original microscope nuclei images are stored
call("ij.Prefs.set", "global.inputFolder","");
call("ij.Prefs.set", "global.controlFolder","");
call("ij.Prefs.set", "global.channelsNumberSet", false);
call("ij.Prefs.set", "global.channelsNumber",-1);
call("ij.Prefs.set", "global.smooth",false);
call("ij.Prefs.set", "global.singleChannel",false);
for(i=1; i<	6; i++) {
	tempText="global.measureChannel"+i;
	call("ij.Prefs.set", tempText, true);
	tempText="global.singleChannelTag"+i;
	call("ij.Prefs.set", tempText, "");
}	
defaultStages=newArray("prelepto","earlylepto", "lepto", "leptozygo","zygo","pachy","diplo");
call("ij.Prefs.set", "global.stagesNumber",-1);
call("ij.Prefs.set", "global.maxStagesNumber",-1);
call("ij.Prefs.set", "global.stagesNumber", defaultStages.length);
call("ij.Prefs.set", "global.maxStagesNumber", defaultStages.length);
for(i=0; i<	defaultStages.length; i++) {
	tempText="global.measureChannel"+i;
	call("ij.Prefs.set", tempText, true);
	tempText="global.stage"+i;
	call("ij.Prefs.set", tempText, "");
	call("ij.Prefs.set", tempText, defaultStages[i]);
}
call("ij.Prefs.set", "global.noReset",false);
call("ij.Prefs.set", "global.resetStatus","");
call("ij.Prefs.set", "global.ROImode","");
call("ij.Prefs.set", "global.referenceRoiIndex",-1);
call("ij.Prefs.set", "global.ROImode","user-defined ROI");
call("ij.Prefs.set", "global.nucleusChannel",-1);
call("ij.Prefs.set", "global.nucleusChannel",1);
defaultThresholds=newArray("Triangle","Huang", "Moments");
thresholdTypes=newArray("nucleus","defaultNucleus");
for (tt=0; tt<thresholdTypes.length; tt++) {
	tempText="global."+thresholdTypes[tt]+"ThresholdsNumber";
	call("ij.Prefs.set", tempText,-1);
	call("ij.Prefs.set", tempText, defaultThresholds.length);
	for(i=0; i<	defaultThresholds.length; i++) {
		tempText="global."+thresholdTypes[tt]+"Threshold"+i;
		call("ij.Prefs.set", tempText, "");
		call("ij.Prefs.set", tempText, defaultThresholds[i]);
	}
}	
call("ij.Prefs.set", "global.wholeAxisChannel",-1);
call("ij.Prefs.set", "global.wholeAxisChannel",4);
call("ij.Prefs.set", "global.wholeAxisRoiIndex",-1);
call("ij.Prefs.set", "global.rawWholeAxisRoiIndex",-1);
call("ij.Prefs.set", "global.off-axisRoiIndex",-1);
call("ij.Prefs.set", "global.axisThreshold","");		
call("ij.Prefs.set", "global.axisThreshold","Huang");
defaultThresholds=newArray("Triangle","Huang", "Moments");
thresholdTypes=newArray("axis","defaultAxis");
for (tt=0; tt<thresholdTypes.length; tt++) {
	tempText="global."+thresholdTypes[tt]+"ThresholdsNumber";
	call("ij.Prefs.set", tempText,-1);
	call("ij.Prefs.set", tempText, defaultThresholds.length);
	for(i=0; i<	defaultThresholds.length; i++) {
		tempText="global."+thresholdTypes[tt]+"Threshold"+i;
		call("ij.Prefs.set", tempText, "");
		call("ij.Prefs.set", tempText, defaultThresholds[i]);
	}
}
call("ij.Prefs.set", "global.usesMultiplePruningMethods",false);
call("ij.Prefs.set", "global.selectedPruningMethod","");
call("ij.Prefs.set", "global.selectedPruningMethod","None");
call("ij.Prefs.set", "global.binaryTool1","");
call("ij.Prefs.set", "global.binaryTool2","");
call("ij.Prefs.set", "global.binaryTool1","Erode");
call("ij.Prefs.set", "global.binaryTool2","Nothing");
call("ij.Prefs.set", "global.processingCycles", -1);
call("ij.Prefs.set", "global.processingCycles", 1);
call("ij.Prefs.set", "global.pruningStrength",-1);
call("ij.Prefs.set", "global.pruningStrength",3);

call("ij.Prefs.set", "global.usePresetPruningMethods", false);
call("ij.Prefs.set", "global.usePresetPruningMethods", true);
call("ij.Prefs.set", "global.numberOfPresetPruningMethods",-1);
defaultPresetPruningModes=newArray("None","2x Erosion","2x [Erosion & Dilation]","2x Erosion then 2x Dilation", "2x Dilation");
call("ij.Prefs.set", "global.numberOfPresetPruningMethods",-1);
call("ij.Prefs.set", "global.numberOfPresetPruningMethods",defaultPresetPruningModes.length);
for (i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)); i++) {
	tempText="global.isSelectedAxisPruningMode"+i;
	call("ij.Prefs.set", tempText,false);
	tempText="global.presetPruningMethod"+i;
	call("ij.Prefs.set", tempText,"");
	call("ij.Prefs.set", tempText,defaultPresetPruningModes[i]);
}
call("ij.Prefs.set", "global.presetPruningStrength",-1);
call("ij.Prefs.set", "global.presetPruningStrength",3);

call("ij.Prefs.set", "global.useCustomPruningMethods", false);
defaultBinaryTools=newArray("Nothing","Erode","Dilate","Close", "Open");
call("ij.Prefs.set", "global.numberOfDefaultBinaryTools",-1);
call("ij.Prefs.set", "global.numberOfDefaultBinaryTools",defaultBinaryTools.length);
for (i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfDefaultBinaryTools",-1)); i++) {
	tempText="global.defaultBinaryTool"+i;
	call("ij.Prefs.set", tempText,"");
	call("ij.Prefs.set", tempText, defaultBinaryTools[i]);
}

call("ij.Prefs.set", "global.customBinaryTool1","");
call("ij.Prefs.set", "global.customBinaryTool2","");
call("ij.Prefs.set", "global.customBinaryTool1","Erode");
call("ij.Prefs.set", "global.customBinaryTool2","None");
call("ij.Prefs.set", "global.customPruningStrength",-1);
call("ij.Prefs.set", "global.customPruningStrength",3);
call("ij.Prefs.set", "global.customProcessingCycles", -1);
call("ij.Prefs.set", "global.customProcessingCycles", 1);

call("ij.Prefs.set", "global.validPruningMethods", -1);
call("ij.Prefs.set", "global.synapsisMode","");
call("ij.Prefs.set", "global.synapsisMode","Use synapsed axis channel");
call("ij.Prefs.set", "global.synapsisReferenceChannel",-1);
call("ij.Prefs.set", "global.synapsisReferenceChannel",2);
call("ij.Prefs.set", "global.synapsisThreshold","");
call("ij.Prefs.set", "global.synapsisThreshold","Yen");
defaultThresholds=newArray("Triangle","Huang", "Moments", "Yen");
thresholdTypes=newArray("synapsis","defaultSynapsis");
for (tt=0; tt<thresholdTypes.length; tt++) {
	tempText="global."+thresholdTypes[tt]+"ThresholdsNumber";
	call("ij.Prefs.set", tempText,-1);
	call("ij.Prefs.set", tempText, defaultThresholds.length);
	for(i=0; i<	defaultThresholds.length; i++) {
		tempText="global."+thresholdTypes[tt]+"Threshold"+i;
		call("ij.Prefs.set", tempText, "");
		call("ij.Prefs.set", tempText, defaultThresholds[i]);
	}
}
call("ij.Prefs.set", "global.synapsisAxisRoiIndex",-1);
call("ij.Prefs.set", "global.rawSynapsisAxisRoiIndex",-1);

call("ij.Prefs.set", "global.measureAxesChannelsIntensities", false);
call("ij.Prefs.set", "global.measureAxesChannelsIntensities", true);
call("ij.Prefs.set", "global.measureFociChannelsIntensities", false);
call("ij.Prefs.set", "global.measurementChannel",-1);
call("ij.Prefs.set", "global.measurementChannel",4);
call("ij.Prefs.set", "global.fociType","");
call("ij.Prefs.set", "global.fociType","axis");
call("ij.Prefs.set", "global.fociDetectionMode","");
call("ij.Prefs.set", "global.fociDetectionMode","within ROI");
call("ij.Prefs.set", "global.fociThreshold","");
call("ij.Prefs.set", "global.fociThreshold","IJ_IsoData");
defaultThresholds=newArray("None", "Huang", "IJ_IsoData");
thresholdTypes=newArray("foci","defaultFoci");
for (tt=0; tt<thresholdTypes.length; tt++) {
	tempText="global."+thresholdTypes[tt]+"ThresholdsNumber";
	call("ij.Prefs.set", tempText,-1);
	call("ij.Prefs.set", tempText, defaultThresholds.length);
	for(i=0; i<	defaultThresholds.length; i++) {
		tempText="global."+thresholdTypes[tt]+"Threshold"+i;
		call("ij.Prefs.set", tempText, "");
		call("ij.Prefs.set", tempText, defaultThresholds[i]);
	}
}

letters=newArray("","A","B");
defaultChannels=newArray(2, 2, 3);
defaultTypes=newArray("total", "axis", "off-axis");
defaultColocStatus=newArray("", "coloc", "notColoc");
defaultNoises=newArray(500,500,300);
for(n=0; n<letters.length; n++) {
	tempText="global.fociChannel"+letters[n];
	call("ij.Prefs.set", tempText,-1);
	call("ij.Prefs.set", tempText,defaultChannels[n]);
	tempText="global.noise"+letters[n];
	call("ij.Prefs.set", tempText,-1);
	call("ij.Prefs.set", tempText,defaultNoises[n]);
	tempText="global.rawTotalFoci"+letters[n]+"ParticleRoiIndex";
	call("ij.Prefs.set", tempText,-1);
	tempText="global.foci"+letters[n]+"LowerThresholdValue";
	call("ij.Prefs.set", tempText,-1);
	tempText="global.foci"+letters[n]+"UpperThresholdValue";
	call("ij.Prefs.set", tempText,-1);
	for (j=0; j<defaultTypes.length; j++) {
		for (k=0; k<defaultColocStatus.length; k++) {
		tempText="global."+defaultTypes[j]+"Foci"+letters[n]+defaultColocStatus[k]+"RoiIndex";
		call("ij.Prefs.set", tempText,-1);
		tempText="global."+defaultTypes[j]+"Foci"+letters[n]+defaultColocStatus[k]+"ParticleRoiIndex";
		call("ij.Prefs.set", tempText,-1);
		tempText="global."+defaultTypes[j]+"Foci"+letters[n]+defaultColocStatus[k]+"Number";
		call("ij.Prefs.set", tempText,-1);	
		}
	}
}

call("ij.Prefs.set", "global.display","composite");
call("ij.Prefs.set", "global.lastImageFileProcessed",-1);
call("ij.Prefs.set", "global.nucleusThreshold","");
call("ij.Prefs.set", "global.nucleusThreshold","Huang");
call("ij.Prefs.set", "global.toolUsesBothAxisAndOffAxis",false);
call("ij.Prefs.set", "global.saveROIs", false);
call("ij.Prefs.set", "global.saveROIs", true);
call("ij.Prefs.set", "global.circ", -1);
call("ij.Prefs.set", "global.circ", 1);
call("ij.Prefs.set", "global.smallestSize", -1);
call("ij.Prefs.set", "global.smallestSize", 5);
call("ij.Prefs.set", "global.exclude", false);
call("ij.Prefs.set", "global.colocalisation",false);
call("ij.Prefs.set", "global.colocalisation",true);
call("ij.Prefs.set", "global.colocalisationDistance",-1);
call("ij.Prefs.set", "global.colocalisationDistance",0.3);
call("ij.Prefs.set", "global.randomisation", false);
call("ij.Prefs.set", "global.showPValue", false);
call("ij.Prefs.set", "global.randomCycles",-1);
call("ij.Prefs.set", "global.randomCycles",100);
call("ij.Prefs.set", "global.skeletonize",false);
call("ij.Prefs.set", "global.changeProcessedFolderChoice", false);
requires("1.52a");
run("Action Bar",call("ij.Prefs.get", "global.barPath",""));
exit();

function setThresholdPreferences (thresholdTypesNames, thresholdsList) {
for (tt=0; tt<thresholdTypesNames.length; tt++) {
	tempText="global."+thresholdTypesNames[tt]+"ThresholdsNumber";
	call("ij.Prefs.set", tempText,-1);
	call("ij.Prefs.set", tempText, thresholdsList.length);
	for(i=0; i<	thresholdsList.length; i++) {
		tempText="global."+thresholdTypesNames[tt]+"Threshold"+i;
		call("ij.Prefs.set", tempText, "");
		call("ij.Prefs.set", tempText, thresholdsList[i]);
	}
}

<onTop>
<codeLibrary>
function openMultipleChannelsImage(string){
	run("Bio-Formats Importer", "open="+string+" autoscale color_mode=Composite view=Hyperstack stack_order=XYCZT");
	if (call("ij.Prefs.get", "global.display","composite")=="composite") Stack.setDisplayMode("composite");
	else {
		if (call("ij.Prefs.get", "global.display","composite")=="grayscale nucleus")
			{
			Stack.setDisplayMode("grayscale");
			Stack.setChannel(call("ij.Prefs.get", "global.nucleusChannel",-1));
			}
			else {
				Stack.setDisplayMode("grayscale");
				Stack.setChannel(call("ij.Prefs.get", "global.wholeAxisChannel",-1));
			}
		}
}

function findFiles(inputFolder,singleChannelFile,singleChannelTags,extension,imagesList,start) {
	if (inputFolder=="0") return(-1);
	else{
		if (start<imagesList.length+1){
			if(singleChannelFile){
				singleFileFound=newArray(call("ij.Prefs.get", "global.channelsNumber",-1));
				for(i=0; i<singleFileFound.length; i++) singleFileFound[i]=false;
				for (i = start; i < imagesList.length; i++){
					if(File.isDirectory(inputFolder+File.separator+imagesList[i])==false){
						if (endsWith(toLowerCase(imagesList[i]), extension) && indexOf(toLowerCase(imagesList[i]),singleChannelTag)>-1) return(i);
					}
				}
				return(-1);
			}
			else{
				for (i = start; i < imagesList.length; i++){
					if(File.isDirectory(inputFolder+File.separator+imagesList[i])==false){
						if (endsWith(toLowerCase(imagesList[i]), extension)) return(i);
					}
				}
				return(-1);
			}
		}
		else return(-1);
	}
}

function cropStage(stage) {
	inputFolder=call("ij.Prefs.get", "global.inputFolder","");
	if (inputFolder=="") {showMessage("click on start button first");}
	else {
		processedFolder=inputFolder+File.separator+"processedData";
		call("ij.Prefs.set", "global.processedFolder",processedFolder);
		if (File.isDirectory(processedFolder)==false) File.makeDirectory(processedFolder);	
		title=getTitle();
		Stack.getDimensions(width, height, channels, slices, frames);
		nRois=roiManager("count");
		if(nRois>0){
			for (i=0; i<nRois; i++){
				selectWindow(title);
				roiManager("Select", i);
				run("Duplicate...", "duplicate");
				rename("duplicate");
				roiManager("add");
				roiManager("select", roiManager("count")-1);
				RoiManager.setGroup(1);
				roiManager("rename", "user-defined");
				roiName=processedFolder+File.separator+"user-defined_"+stage+"_"+substring(title,0,indexOf(title,"."))+"_"+i+".roi";
				roiManager("save selected", roiName);
				if(notFullFrameRoi(i, width, height)) {
					selectWindow("duplicate");
					roiManager("select", roiManager("count")-1);
					run("Make Inverse");
					setBackgroundColor(0, 0, 0);
					for(j=1; j<channels+1; j++){
						Stack.setChannel(j);
						run("Clear", "slice");
					}	
					run("Select None");
				}
				if (channels>1) Stack.setDisplayMode("composite");
				name=processedFolder+File.separator+stage+"_"+substring(title,0,indexOf(title,"."))+"_"+i;
				saveAs("Tiff", name);
				close();	
			}
		roiManager("reset");
		}
	else showMessage("There is no ROI in the ROI manager");
	}
}

function getStage(number) {
	tempText="global.stage"+number;
	output=call("ij.Prefs.get", tempText, "");
	return output;
}

function notFullFrameRoi(roiIndex, imageWidth, imageHeight){
	output=true;
	roiManager("select", i);
	Roi.getBounds(x,y,w,h);
	if(Roi.getType=="rectangle" && x==0 && y==0 && w==imageWidth && h==imageHeight) output=false;
	return(output);
}

function initializeImageTable(table){
	Table.set("Type", 0, "", table);
	Table.set("Image name", 0, "", table);
	if (call("ij.Prefs.get", "global.skeletonize",false)) {
		if (call("ij.Prefs.get", "global.showRoughValues", false)) Table.set("rough whole axis length (um)", 0, "", table);
		if (call("ij.Prefs.get", "global.showFineValues", false)) Table.set("fine whole axis length (um)", 0, "", table);
		if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length"){
			if (call("ij.Prefs.get", "global.showRoughValues", false))Table.set("rough "+substring(call("ij.Prefs.get", "global.synapsisMode",""), 4, indexOf(call("ij.Prefs.get", "global.synapsisMode",""), " channel"))+" length (um)", 0, "", table);
			if (call("ij.Prefs.get", "global.showFineValues", false))Table.set("fine "+substring(call("ij.Prefs.get", "global.synapsisMode",""), 4, indexOf(call("ij.Prefs.get", "global.synapsisMode",""), " channel"))+" length (um)", 0, "", table);
		}
	}
	if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel"){
		Table.set("axis_foci", 0, "", table);
		Table.set("off-axis_foci", 0, "", table);
	}
	if (call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize"){
		Table.set("fociA", 0, "", table);
		Table.set("fociB", 0, "", table);
		if (call("ij.Prefs.get", "global.colocalisation",false)) {
			Table.set("colocalised fociA", 0, "", table);
			Table.set("colocalised fociB", 0, "", table);
			if (call("ij.Prefs.get", "global.randomisation",false)) {
				Table.set("Mean randomly colocalised fociA", 0, "", table);
				Table.set("Mean randomly colocalised fociB", 0, "", table);
			}
		}
	}	
	if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"){
		if (call("ij.Prefs.get", "global.fociType","")=="axis") {
			Table.set("axis_fociA", 0, "", table);
			Table.set("axis_fociB", 0, "", table);
			if (call("ij.Prefs.get", "global.colocalisation",false)) {
				Table.set("colocalised axis_fociA", 0, "", table);
				Table.set("colocalised axis_fociB", 0, "", table);
				if (call("ij.Prefs.get", "global.randomisation",false)) {
					Table.set("Mean randomly colocalised axis_fociA", 0, "", table);
					Table.set("Mean randomly colocalised axis_fociB", 0, "", table);
				}
			}
		}
		else {
			if (call("ij.Prefs.get", "global.fociType","")=="off-axis"){
				Table.set("off-axis_fociA", 0, "", table);
				Table.set("off-axis_fociB", 0, "", table);
				if (call("ij.Prefs.get", "global.colocalisation",false)) {
					Table.set("colocalised off-axis_fociA", 0, "", table);
					Table.set("colocalised off-axis_fociB", 0, "", table);
					if (call("ij.Prefs.get", "global.randomisation",false)) {
						Table.set("Mean randomly colocalised off-axis_fociA", 0, "", table);
						Table.set("Mean randomly colocalised off-axis_fociB", 0, "", table);
					}
				}	
			}
		}	
	}	
	if ((call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)||parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false))&&(call("ij.Prefs.get","global.showAxesValues",false)||call("ij.Prefs.get", "global.showReferenceRoiValues",false)||call("ij.Prefs.get", "global.showFociValues",false))) {
		channelArraySize=0;
		if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
			channelArraySize++;
			if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") channelArraySize++;
		}
		if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)){
			if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") channelArraySize++;
			if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") channelArraySize+=2;
		}
		if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) channelArraySize++;
		channelParam=newArray(channelArraySize);
		channelParamID=0;
		if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
			channelParam[channelParamID]="whole axis ch.";
			channelParamID++;
			if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") {
				channelParam[channelParamID]=substring(call("ij.Prefs.get", "global.synapsisMode",""), 4, indexOf(call("ij.Prefs.get", "global.synapsisMode",""), " channel"))+" ch.";
				channelParamID++;
			}	
		}
		if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)){
			if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") {
				channelParam[channelParamID]="foci ch.";
				channelParamID++;
				}
			if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize" || call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") {
				channelParam[channelParamID]="fociA ch.";
				channelParam[channelParamID+1]="fociB ch.";
				channelParamID+=2;
			}
		}
		if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) {
			channelParam[channelParamID]=getChannelName(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1)));		
		}
		roiArraySize=0;
		if (call("ij.Prefs.get","global.showAxesValues",false)||call("ij.Prefs.get", "global.showReferenceRoiValues",false)||call("ij.Prefs.get","global.showFociValues",false)){
			if (call("ij.Prefs.get","global.showAxesValues",false)) {
				roiArraySize++;
				if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") roiArraySize++; 
			}
			if (call("ij.Prefs.get","global.showFociValues",false)){
				if (call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)) types=newArray("axis ", "off-axis ");
				else types=newArray(call("ij.Prefs.get", "global.fociType","")+" ");
				if (types[0]=="total ") types[0]="";
				if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") {
					letters=newArray("A","B");
					if (call("ij.Prefs.get", "global.colocalisation",false)) colocStatuses=newArray("colocalised ", "not colocalised ");
					else colocStatuses=newArray("");
				}	
				else {
					letters=newArray("");
					colocStatuses=newArray("");
				}	
				if (call("ij.Prefs.get", "global.showMaximumValues", false)) roiArraySize+=letters.length*types.length*colocStatuses.length;
				if (call("ij.Prefs.get", "global.showParticleValues", false)) roiArraySize+=letters.length*types.length*colocStatuses.length;
			}	
			if (call("ij.Prefs.get", "global.showReferenceRoiValues",false)) roiArraySize++;
			roiParam=newArray(roiArraySize);
			roiParamID=0;
			if (call("ij.Prefs.get","global.showAxesValues",false)) {
				roiParam[roiParamID]="(whole axis)";
				roiParamID++;
				if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") {
					roiParam[roiParamID]="("+substring(call("ij.Prefs.get", "global.synapsisMode",""), 4, indexOf(call("ij.Prefs.get", "global.synapsisMode",""), " channel"))+")";
					roiParamID++;
				}
			}
			if (call("ij.Prefs.get","global.showFociValues",false)){
				for(t=0; t<types.length; t++) {
					for (cs=0; cs<colocStatuses.length; cs++){
						for (l=0; l<letters.length; l++) {
							if (call("ij.Prefs.get", "global.showMaximumValues", false)) {
								roiParam[roiParamID]="("+colocStatuses[cs]+types[t]+"foci"+letters[l]+" maxima)";
								roiParamID++;
							}
							if (call("ij.Prefs.get", "global.showParticleValues", false)) {
								roiParam[roiParamID]="("+colocStatuses[cs]+types[t]+"foci"+letters[l]+" particles)";
								roiParamID++;
							}
						}		
					}
				}	
			}	
			if (call("ij.Prefs.get", "global.showReferenceRoiValues",false)) {
		 		if (call("ij.Prefs.get", "global.ROImode","")=="nucleus threshold") roiParam[roiParamID]="(nucleus)";
		 		else roiParam[roiParamID]="("+call("ij.Prefs.get", "global.ROImode","")+")";
			}
			for(roi=0; roi<roiParam.length; roi++) {
				for(channel=0; 	channel<channelParam.length; channel++) {
					if (call("ij.Prefs.get", "global.showIntDenValues", false)){
						param=channelParam[channel]+" intDen "+roiParam[roi];
						Table.set(param,0,"", table);
					}	
					if (call("ij.Prefs.get", "global.showMeanValues", false)&&!endsWith(roiParam[roi], "maxima)")) {
						param=channelParam[channel]+" mean "+roiParam[roi];
						Table.set(param,0,"", table);
					}
				}
			}
		}			
	}
	Table.set("Comment",0,"", table);
	Table.set("", 0, "", table);
	Table.set("Parameter", 0, "", table);
	Table.set("Value",0,"", table);
}

function initializeParticleTable(table){
	Table.set("Type", 0, "", table);
	Table.set("Image name", 0, "", table);
	Table.set("focus' ID", 0, "", table);
	if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") Table.set("focus' channel", 0, "", table);	
	if(call("ij.Prefs.get", "global.tool","")!="Count foci in two channels and colocalize")Table.set("focus' type", 0, "", table);	
	if ((call("ij.Prefs.get", "global.tool","")=="Count foci axis/off-axis in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")!="Count foci in two channels and colocalize")&& call("ij.Prefs.get", "global.colocalisation",false))	Table.set("focus' colocalisation status", 0, "", table);
	channelArraySize=0;	
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) channelArraySize++;
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)){
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") channelArraySize+=2;
	}
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) channelArraySize++;
	channelParam=newArray(channelArraySize);
	channelParamID=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		channelParam[channelParamID]="whole axis ch.";
		channelParamID++;
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)){
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") {
			channelParam[channelParamID]="foci ch.";
			channelParamID++;
			}
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") {
			channelParam[channelParamID]="fociA ch.";
			channelParam[channelParamID+1]="fociB ch.";
			channelParamID+=2;
		}
	}
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) channelParam[channelParamID]=getChannelName(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1)));
	
	if (call("ij.Prefs.get","global.showFociValues",false)||call("ij.Prefs.get", "global.showReferenceRoiValues",false)){
		roiArraySize=0;
		if (call("ij.Prefs.get","global.showMaximumValues",false)) roiArraySize++;
		if (call("ij.Prefs.get","global.showParticleValues",false)) roiArraySize++;
		roiParam=newArray(roiArraySize);
		roiParamID=0;
		if (call("ij.Prefs.get","global.showMaximumValues",false)) {
			roiParam[roiParamID]="(focus' maximum)";
			roiParamID++;
		}	
		if (call("ij.Prefs.get","global.showParticleValues",false)) {
			roiParam[roiParamID]="(focus' particle)";
			roiParamID++;
		}
		for(roi=0; roi<roiParam.length; roi++) {
			for(channel=0; 	channel<channelParam.length; channel++) {
				if (call("ij.Prefs.get", "global.showIntDenValues", false)){
					param=channelParam[channel]+" intDen "+roiParam[roi];
					Table.set(param,0,"", table);
				}	
				if (call("ij.Prefs.get", "global.showMeanValues", false)&&!endsWith(roiParam[roi], "maximum)")) {
					param=channelParam[channel]+" mean "+roiParam[roi];
					Table.set(param,0,"", table);
				}
			}
		}
	}
	Table.update(table);
}	

function findStageFiles(stageArray, inputFolder,imagesList,start){
	if (inputFolder=="0") {return(-1);}
	else {
		if (start<imagesList.length+1) {
			for (i = start; i < imagesList.length; i++) {
				if(File.isDirectory(inputFolder+File.separator+imagesList[i])==false){
					for (j = 0; j < stageArray.length; j++){
						if(startsWith(imagesList[i], stages[j])&& endsWith(imagesList[i], ".tif")) return(i);	
					}
				}
			}
			return(-1);
		}
	}
}

function getChannelName(channel) {
	if (call("ij.Prefs.get", "global.tool","")=="Measure Global intensities"){
		if (channel==parseInt(call("ij.Prefs.get", "global.nucleusChannel",-1))) return "nucleus ch.";
		else {
			tempText="Ch."+toString(channel);
			return tempText;
		}
	}
	if (call("ij.Prefs.get", "global.tool","")=="Measure axis length"){
		if (channel==parseInt(call("ij.Prefs.get", "global.nucleusChannel",-1))) return "nucleus ch.";
		else {
			if (channel==parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))) return "whole axis ch.";
			else {
				tempText="Ch."+toString(channel); 			
				return tempText;
			}
		}
	}
	if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length"){
		if (channel==parseInt(call("ij.Prefs.get", "global.nucleusChannel",-1))) return "nucleus ch.";
		else {
			if (channel==parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))) return "whole axis ch.";
			else {
				if (channel==parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1))){
					if (call("ij.Prefs.get", "global.synapsisMode","")=="Use synapsed axis channel") return "synapsed axis ch.";
					else return "non-synapsed axis ch.";
				}
				else {
					tempText="Ch."+toString(channel);
					return tempText;
				}
			}
		}
	}
	if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel"){
		if (channel==parseInt(call("ij.Prefs.get", "global.nucleusChannel",-1))) return "nucleus ch.";
		else {
			if (channel==parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))) return "whole axis ch.";
			else {
				if (channel==parseInt(call("ij.Prefs.get", "global.fociChannel",-1))) return "foci ch.";
				else {
					tempText="Ch."+toString(channel); 
					return tempText;
				}
			}
		}
	}
	if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"){
		if (channel==parseInt(call("ij.Prefs.get", "global.nucleusChannel",-1))) return "nucleus ch.";
		else {
			if (channel==parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))) return "whole axis ch.";
			else {
				if (channel==parseInt(call("ij.Prefs.get", "global.fociChannelA",-1))) return"fociA ch.";
				else {
					if (channel==parseInt(call("ij.Prefs.get", "global.fociChannelB",-1))) return"fociB ch.";
					else {
						tempText="Ch."+toString(channel);
						return tempText;
					}
				}
			}
		}
	}
	if (call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize"){
		if (channel==parseInt(call("ij.Prefs.get", "global.nucleusChannel",-1))) return "nucleus ch.";
		else {
			if (channel==parseInt(call("ij.Prefs.get", "global.fociChannelA",-1))) return"fociA ch.";
			else {
				if (channel==parseInt(call("ij.Prefs.get", "global.fociChannelB",-1))) return"fociB ch.";
				else {
					tempText="Ch."+toString(channel);
					return tempText;
				}
			}
		}
	}
}

function setAdvancedUserParameters() {
	pruningMethods=newArray(parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1))+1);
	for(i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)); i++) {
		tempText="global.presetPruningMethod"+i;
		pruningMethods[i]=call("ij.Prefs.get", tempText,"");
	}
	pruningMethods[parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1))]="Custom";
	binaryTools=newArray(parseInt(call("ij.Prefs.get", "global.numberOfDefaultBinaryTools",-1)));
	for (i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfDefaultBinaryTools",-1)); i++) {
		tempText="global.defaultBinaryTool"+i;
		binaryTools[i]=call("ij.Prefs.get", tempText, "");
	}
	Dialog.create("Advanced user parameters");
	Dialog.addCheckbox("Smooth original images", call("ij.Prefs.get", "global.smooth",false));
	Dialog.addCheckbox("Use the threshold no-reset option", call("ij.Prefs.get", "global.noReset",false));
	Dialog.addMessage("Raw axis additionnal detection parameters");
	Dialog.addNumber("   Maximum axis circularity:", call("ij.Prefs.get", "global.circ", -1));
	Dialog.addCheckbox("   Exclude edges-touching axis", call("ij.Prefs.get", "global.exclude", false));
	Dialog.addMessage("Raw axis processing parameters");
	Dialog.addChoice("   Pruning method: ", pruningMethods, call("ij.Prefs.get", "global.selectedPruningMethod",""));
	Dialog.addToSameRow();
	Dialog.addNumber("Pruning strength (1 to 8)", parseInt(call("ij.Prefs.get", "global.pruningStrength",-1)),0,1, " pixels");		
	Dialog.addMessage("If custom pruning method selected");
	Dialog.addNumber("   Number of processing cycles", call("ij.Prefs.get", "global.processingCycles", -1), 0, 2, "");
	Dialog.addChoice("   First binary tool ", binaryTools, call("ij.Prefs.get", "global.binaryTool1",""));
	Dialog.addChoice("   Second binary tool ", binaryTools, call("ij.Prefs.get", "global.binaryTool2",""));
	Dialog.show();

	call("ij.Prefs.set", "global.smooth",Dialog.getCheckbox());
	call("ij.Prefs.set", "global.noReset",Dialog.getCheckbox());
	if (call("ij.Prefs.get", "global.noReset",false)) call("ij.Prefs.set", "global.resetStatus","no-reset");
	else call("ij.Prefs.set", "global.resetStatus","");
	call("ij.Prefs.set", "global.circ", Dialog.getNumber());
	call("ij.Prefs.set", "global.exclude", Dialog.getCheckbox());
	call("ij.Prefs.set", "global.selectedPruningMethod",Dialog.getChoice());
	call("ij.Prefs.set", "global.pruningStrength", Dialog.getNumber());	
	if (parseInt(call("ij.Prefs.get", "global.presetPruningStrength",-1))<1 ||parseInt(call("ij.Prefs.get", "global.presetPruningStrength",-1))>8.1)  call("ij.Prefs.set", "global.presetPruningStrength", 3);	
	call("ij.Prefs.set", "global.processingCycles", Dialog.getNumber());
	if (parseInt(call("ij.Prefs.get", "global.processingCycles", -1)>100) call("ij.Prefs.set", "global.processingCycles", 100);
	if (parseInt(call("ij.Prefs.get", "global.processingCycles", -1)<1) call("ij.Prefs.set", "global.processingCycles", 1);
	call("ij.Prefs.set", "global.binaryTool1",Dialog.getChoice());
	call("ij.Prefs.set", "global.binaryTool2",Dialog.getChoice());
	getPruningParameters(call("ij.Prefs.get", "global.selectedPruningMethod",""));
}

function getMaxChannel () {
	output=0;
	if (call("ij.Prefs.get", "global.ROImode","")=="nucleus threshold") output=Math.max(output, parseInt(call("ij.Prefs.get", "global.nucleusChannel",-1)));
	if (call("ij.Prefs.get", "global.tool","")!="Measure Global intensities") {
		if (call("ij.Prefs.get", "global.channelsNumber",-1)>-1) {
			for(i=1; i<	call("ij.Prefs.get", "global.channelsNumber",-1)+1; i++) {
			tempText="global.measureChannel"+i;
			output=Math.max(output,parseInt(call("ij.Prefs.get", tempText,-1))); 
			}
		}	
	}
	if (call("ij.Prefs.get", "global.tool","")=="Measure axis length"||call("ij.Prefs.get", "global.tool","")=="Measure synapse length"||call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel"||call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get","global.tool", "")=="Set advanced user parameters") output=Math.max(output, parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1)));
	if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") output=Math.max(output, parseInt(call("ij.Prefs.get", "synapsisReferenceChannel",-1)));
	if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") output=Math.max(output, parseInt(call("ij.Prefs.get", "fociChannel",-1)));
	if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize"){
		output=Math.max(output, parseInt(call("ij.Prefs.get", "fociChannelA",-1)));
		output=Math.max(output, parseInt(call("ij.Prefs.get", "fociChannelB",-1)));
	}
	return(output);
}

function checkChannels(foundChannels, lastChannel, table, row, imageName) {
	call("ij.Prefs.set", "global.channelTestPassed", false);
	if (foundChannels>=lastChannel) call("ij.Prefs.set", "global.channelTestPassed", true);
	else {
		if (row>-1) {
			addTableComment(table, row, "some mandatory channels are missing");
			fillTable(table, row, "");
		}
		else{
			if (call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning",imageName+": some channels are missing");
		}
	}
}

function addTableComment(table, row, message){
	tempText=Table.getString("Comment", row, table);
	if (tempText=="") tempText=message;
	else tempText+=", "+message;
	Table.set("Comment", row, tempText, table);
	Table.update(table);
}

function fillTable(table, row, message) {
	text=Table.headings(table);
	while (lastIndexOf(text, "\t")!=-1) {
		col=substring(text, lastIndexOf(text, "\t")+1);
		if (col!="Parameter" && col!="Value"&& col!="Type"&& col!="Image Name"&& col!="Comment"){
			if (Table.getString(col, row, table)=="") Table.set(col, row, message, table);
		}
		text=substring(text,0, (lastIndexOf(text, "\t")));
	}
	if (text!="Parameter" && text!="Value"&& text!="Type"&& text!="Image Name"&& text!="Comment"){
		if (Table.getString(text, row, table)=="") Table.set(text, row, message, table);
	}
	Table.update(table);
}

function getReferenceRoi(imageName, roiPath, row, table){
	call("ij.Prefs.set", "global.referenceRoiIndex",-1);
	if (call("ij.Prefs.get", "global.ROImode","")=="user-defined ROI") {
		selectWindow(imageName);
		if (File.exists(roiPath)) {
			if (roiManager("count")>0) {
				roiManager("deselect");
				roiManager("delete");
			}
			roiManager("open", roiPath);
			roiManager("select",0);
			RoiManager.setGroup(1);
			roiManager("rename", "user-defined ROI");
			call("ij.Prefs.set", "global.referenceRoiIndex",0);
		}
		else {
			if (row>-1) {
				addTableComment(table, row, "could not find the companion ROI");
				fillTable(table, row, "");
			}	
		}
	}
	else {
		if (roiManager("count")>0) {
			roiManager("deselect");
			roiManager("delete");
		}
		selectWindow(imageName);
		run("Specify...", "width="+getWidth()+" height="+getHeight()+" x=0 y=0");	
		run("Duplicate...", "duplicate channels="+call("ij.Prefs.get", "global.nucleusChannel",-1)+"");
		rename("nucleus");
		setAutoThreshold(""+call("ij.Prefs.get", "global.nucleusThreshold","")+" dark "+call("ij.Prefs.get", "global.resetStatus","")+"");
		if (getValue("Area limit")>0){
			run("Create Selection");
			roiManager("Add");
			roiManager("select",0);
			RoiManager.setGroup(1);
			roiManager("rename", "nucleus");
			call("ij.Prefs.set", "global.referenceRoiIndex",0);	
		}
		else {
			if (row>-1) {
				addTableComment(table, row, "no nucleus found");
				fillTable(table, row, "");
			}	
		}
		close("nucleus");	
	}
}

function measure(channel, table, index, rowDuplication, roiIndex, roiName, imageName){
	channelParam=getChannelName(channel);
	selectWindow(imageName);
	if (roiName=="nucleus threshold") roiParam="(nucleus)";
	else roiParam="("+roiName+")";
	if (channel<parseInt(call("ij.Prefs.get", "global.channelsNumber",-1))+1 && roiIndex>-1){
		Stack.setChannel(channel);	
		roiManager("select", roiIndex);
		if(Roi.getType=="point"&&Roi.size>1){
			getRawStatistics(nPixels, mean, min, max, std, histogram);
			if (call("ij.Prefs.get", "global.showIntDenValues", false)){
				param=channelParam+" intDen "+roiParam;
				run("Set Measurements...", "area redirect=None decimal=0");
				tempValue= mean*nPixels;
				for(n=0; n<rowDuplication; n++) Table.set(param, index+n, tempValue, table);
			}
				
		}
		else{
			if (call("ij.Prefs.get", "global.showIntDenValues", false)){
				param=channelParam+" intDen "+roiParam;
				run("Set Measurements...", "area redirect=None decimal=0");
				tempValue= getValue("RawIntDen");
				for(n=0; n<rowDuplication; n++) Table.set(param, index+n, tempValue, table);
			}	
			if (call("ij.Prefs.get", "global.showMeanValues", false)&&Roi.size>1) {
				param=channelParam+" mean "+roiParam;
				run("Set Measurements...", "area redirect=None decimal=2");
				tempValue= getValue("Mean");
				for(n=0; n<rowDuplication; n++) Table.set(param, index+n, tempValue, table);
			}
		}	
		for(n=0; n<rowDuplication; n++) {
			if (Table.getString("Comment", index+n, table)=="0") Table.set("Comment",index+n,"", table);
		}
	}	
	else {
		headers=Table.headings(table);
		if (call("ij.Prefs.get", "global.showIntDenValues", false)){
			param=channelParam+" intDen "+roiParam;
			if (indexOf(headers, param)>-1) {
				for(n=0; n<rowDuplication; n++) Table.set(param, index+n, "", table);
			}
		}	
		if (call("ij.Prefs.get", "global.showMeanValues", false)&&!(Roi.getType=="point"&&Roi.size>1)) {
			param=channelParam+" mean "+roiParam;
			if (indexOf(headers, param)>-1){
				for(n=0; n<rowDuplication; n++) Table.set(param, index+n, "", table);
			}
		}
		if (!call("ij.Prefs.get", "global.channelErrorMessageShown", false) && channel>parseInt(call("ij.Prefs.get", "global.channelsNumber",-1))) {
			call("ij.Prefs.set", "global.channelErrorMessageShown", true);
			tempText="ch."+channel+" not found";
			for(n=0; n<rowDuplication; n++) {
				if(Table.getString("Comment", index+n, table)!="") tempText=Table.getString("Comment", index+n, table)+", "+tempText;
				Table.set("Comment",index+n,tempText, table);
			}
		}
	}
	Table.update(table);
}

function getRawAxisRoi(imageName, table, index, isWholeAxis, pixelSize){
	if (isWholeAxis) {
		channel=parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1));
		threshold=call("ij.Prefs.get", "global.axisThreshold","");
		windowName="raw whole axis";
		thresholdROI="whole axis threshold";
		call("ij.Prefs.set", "global.rawWholeAxisRoiIndex",-1);
		call("ij.Prefs.set", "global.wholeAxisRoiIndex",-1);
		call("ij.Prefs.set", "global.off-axisRoiIndex",-1);
	}
	else {
		if (parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex",-1))>-1){// previous wholeAxis found and processed			
			channel=parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1));
			threshold=call("ij.Prefs.get", "global.synapsisThreshold","");
			windowName="raw synapsed axis";
			thresholdROI="synapsed axis threshold";
			if (call("ij.Prefs.get", "global.synapsisMode","")!="Use synapsed axis channel")	{
				windowName="raw non-synapsed axis";
				thresholdROI="non-synapsed axis Threshold";
			}
			call("ij.Prefs.set",  "global.rawSynapsisAxisRoiIndex",-1);
			call("ij.Prefs.set", "global.synapsisAxisRoiIndex",-1);
		}
		else {
			if (index>-1) addTableComment("imageAnalysis", index, windowName+" detection cancelled");// previous wholeAxis not found, function skips the identification of the synapsis axis
		}
	}
	roisNumberAtStart=roiManager("count");
	selectWindow(imageName);
	run("Specify...", "width="+getWidth()+" height="+getHeight()+" x=0 y=0");	
	run("Duplicate...", "duplicate channels="+channel+"");
	rename(windowName);
	roiManager("select",parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1)));
	
 	//generates a threshold selection for the purpose of holes identification
 	setAutoThreshold(""+threshold+" dark "+call("ij.Prefs.get", "global.resetStatus","")+"");
 	if (getValue("Area limit")>0){
 		run("Create Selection");
 		roiManager("add"); //a threshold selection was created
 		thresholdROIIndex=roiManager("count")-1;
 		roiManager("select",thresholdROIIndex);
 		roiManager("rename", thresholdROI);
 		run("Specify...", "width="+getWidth()+" height="+getHeight()+" x=0 y=0");	
 		if (isWholeAxis) roiManager("select", 0);//restricts whole axis identification to initial nucleus/user-defined ROI)
 		else roiManager("select", parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex",-1)));// restricts synapsis identification to previous wholeAxis ROI
 		if (call("ij.Prefs.get", "global.exclude", false)) run("Analyze Particles...", "size=+"+call("ij.Prefs.get", "global.smallestSize", -1)+"-Infinity pixel circularity=0.00-"+call("ij.Prefs.get", "global.circ", -1)+" exclude add");
		else run("Analyze Particles...", "size=+"+call("ij.Prefs.get", "global.smallestSize", -1)+"-Infinity pixel circularity=0.00-"+call("ij.Prefs.get", "global.circ", -1)+" add");
		nAxisRois=roiManager("count")-(thresholdROIIndex+1);
		
		if(nAxisRois==1&& index>-1) {
			for (i=0; i<parseInt(call("ij.Prefs.get", "global.validPruningMethods",-1)); i++) {
				row=index+i;
				text=Table.getString("Comment",row, table);
				if (text!="") text+=", "; 
				tempText="a single "+ substring(windowName,4)+ " object was detected";
				addTableComment(table, row, tempText);
			}
		}	
		if (nAxisRois==0) {//no valid axis particle was found, threshold selection deleted
			roiManager("select", thresholdROIIndex);
			roiManager("delete");
			close(windowName);
			if (index>-1) {
				tempText="no valid "+windowName+" particle found";
				noRawAxisFound(table, index, windowName, tempText);
			}
		}
		else {// valid axis particles found, combination with the threshold selection to remove non-thresholded holes within particles		
			indexes=newArray(nAxisRois);// fuses all particles
			for (i=0; i<indexes.length; i++) indexes[i]=thresholdROIIndex+1+i;
			roiManager("select", indexes);
			roiManager("combine");
			roiManager("add");
			roiManager("select", indexes);
			roiManager("delete");
			indexes=newArray(thresholdROIIndex,thresholdROIIndex+1);// merges with the threshold ROI to remove holes
			roiManager("select", indexes);
			roiManager("and");
			if (Roi.size>0) roiManager("add");
			roiManager("select", indexes);
			roiManager("delete");	
			axisROIIndex=roiManager("count")-1;
			if(isWholeAxis) {
				call("ij.Prefs.set", "global.rawWholeAxisRoiIndex",axisROIIndex);
			}
			else {
				call("ij.Prefs.set", "global.rawSynapsisAxisRoiIndex",axisROIIndex);
			}
			roiManager("select",axisROIIndex);
			RoiManager.setGroup(3);
			roiManager("rename", windowName);
		}
 	}
 	else {
 		if (index>-1) {
 			tempText="no pixels above "+thresholdROI+" & no "+windowName+" found";
 			noRawAxisFound(table, index, windowName, tempText);
 		}
 	}
}

function noRawAxisFound(table, index, type, message){
	for (i=0; i<parseInt(call("ij.Prefs.get", "global.validPruningMethods",-1)); i++) {
		row=index+i;
		addTableComment(table, row, message);
		if (call("ij.Prefs.get", "global.skeletonize",false)) {
			if (call("ij.Prefs.get", "global.showRoughValues", false)) Table.set("rough "+ substring(type,4)+"  length (um)", row, "", table);
			if (call("ij.Prefs.get", "global.showFineValues", false)) Table.set("fine " + substring(type,4)+" length (um)", row, "", table);		
		}
	}
}
		
function refineRawAxisRoi (imageName, table, index, isWholeAxis, pixelSize) {
	if (index>-1 &&((isWholeAxis && parseInt(call("ij.Prefs.get", "global.rawWholeAxisRoiIndex", -1))==-1)|| (!isWholeAxis&& parseInt(call("ij.Prefs.get", "global.rawSynapsisAxisRoiIndex", -1))==-1))) setAxisMeasurementsWhenNoRawAxisFound(isWholeAxis, table, index);	
	else {	
		if (isWholeAxis) window="raw whole axis";
		else {
			if (call("ij.Prefs.get", "global.synapsisMode","")=="Use synapsed axis channel") window="raw synapsed axis";
			else window="raw non-synapsed axis";
		}
		if (call("ij.Prefs.get", "global.usesMultiplePruningMethods",false)) {
			methodCount=0;
			if (call("ij.Prefs.get", "global.usePresetPruningMethods", false)){
				for (i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)); i++) {
					tempText="global.isSelectedAxisPruningMode"+i;
					if (call("ij.Prefs.get", tempText, false)) {
						tempText="global.presetPruningMethod"+i;
						getProcessedAxisROI(table, index, imageName, isWholeAxis, call("ij.Prefs.get", tempText, ""), methodCount, pixelSize);
						methodCount++;
					}
				}
			}
			if (call("ij.Prefs.get", "global.useCustomPruningMethods", false)){
				call("ij.Prefs.set", "global.binaryTool1",call("ij.Prefs.get", "global.customBinaryTool1",""));
				call("ij.Prefs.set", "global.binaryTool2",call("ij.Prefs.get", "global.customBinaryTool2",""));
				for(s=1; s<=parseInt(call("ij.Prefs.get", "global.customPruningStrength",-1)); s++) {
					for (c=1; c<=parseInt(call("ij.Prefs.get", "global.customProcessingCycles",-1));c++) {
						call("ij.Prefs.set", "global.processingCycles", c);
						call("ij.Prefs.set", "global.pruningStrength", s);
						method="Custom ["+call("ij.Prefs.get", "global.binaryTool1", "");
						if (call("ij.Prefs.get", "global.binaryTool2", "")!="Nothing") method+=", "+call("ij.Prefs.get", "global.binaryTool2", "");
						method+="] x"+c+" (strength: "+s+")";
						getProcessedAxisROI(table, index, imageName, isWholeAxis, method, methodCount, pixelSize);
						methodCount++;
					}
				}
			}		
		}
		else{
			getProcessedAxisROI(table, index, imageName, isWholeAxis, call("ij.Prefs.get", "global.selectedPruningMethod",""), 0, pixelSize);
		}
		close(window);
	}	
}
					
function setAxisMeasurementsWhenNoRawAxisFound(isWholeAxis, table, row) {
	if (isWholeAxis) type="whole axis";
	else{
		if (call("ij.Prefs.get", "global.synapsisMode","")=="Use synapsed axis channel") type="synapsed axis";
		else type="non-synapsed axis";
	}	
	if (call("ij.Prefs.get", "global.usesMultiplePruningMethods",false)){
		methodCount=0;
		if (call("ij.Prefs.get", "global.usePresetPruningMethods", false)){
			for (i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)); i++) {
				tempText="global.isSelectedAxisPruningMode"+i;
				if (call("ij.Prefs.get", tempText, false)) methodCount=setAxisMeasurementsToBlank(type, table, row, methodCount);	
			}
		}
		if (call("ij.Prefs.get", "global.useCustomPruningMethods", false)){	
			for(s=1; s<=parseInt(call("ij.Prefs.get", "global.customProcessingCycles",-1)); s++) {
				for (c=1; c<=parseInt(call("ij.Prefs.get", "global.customProcessingCycles",-1));c++) methodCount=setAxisMeasurementsToBlank(type, table, row, methodCount);	
			}		
		}
	}		
	else {
	setAxisMeasurementsToBlank(type, table, row, 0);		
	}
}
			
function setAxisMeasurementsToBlank(type, table, row, methodCount) {
	tempRow=row+methodCount;
	if (call("ij.Prefs.get", "global.skeletonize",false)) {
		column=" "+type+" length (um)";
		if (call("ij.Prefs.get", "global.showRoughValues", false)) Table.set("rough"+column, tempRow, "", table);
		if (call("ij.Prefs.get", "global.showFineValues", false)) Table.set("fine"+column, tempRow, "", table);
	}
	if ((call("ij.Prefs.get","global.measureAxesChannelsIntensities",false)||parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1 ||call("ij.Prefs.get","global.measureFociChannelsIntensities",false))&& call("ij.Prefs.get","global.showAxesValues", false)) measureAxisIntensities(table, tempRow, "", -1, type);
	return (methodCount++);
}

function getProcessedAxisROI(table, index, image, isWholeAxis, method, methodCount, pixelSize) {
	if (isWholeAxis) {
		window="whole axis";
		ROIIndex=parseInt(call("ij.Prefs.get", "global.rawWholeAxisRoiIndex",-1));
		call("ij.Prefs.set", "global.wholeAxisRoiIndex",-1);
		call("ij.Prefs.set", "global.off-axisRoiIndex",-1);
	}
	else {
		if (call("ij.Prefs.get", "global.synapsisMode","")=="Use synapsed axis channel") window="synapsed axis";
		else window="non-synapsed axis";
		ROIIndex=parseInt(call("ij.Prefs.get", "global.rawSynapsisAxisRoiIndex",-1));
		call("ij.Prefs.set", "global.synapsisAxisRoiIndex",-1);
	}
	if (index>-1) tempRow=index+methodCount;
	else tempRow=-1;
	selectWindow(image);
	tempName=window+"_"+method;
	newImage(tempName, "8-bit black", getWidth(), getHeight() ,1);
	setForegroundColor(255, 255, 255);
	roiManager("select", ROIIndex);
	run("Fill", "slice");
	processAxisMask(method, tempName);
	setThreshold(255, 255);
	if (getValue("Area limit")>0) {// processedAxis found
		run("Create Selection");
		roiManager("add");
		roiManager("select",roiManager("count")-1);
		RoiManager.setGroup(5);
		roiName=window;
		if (i>0) if (method!="None") roiName+=" ("+method+")";
		roiManager("rename", roiName);
		axisROIIndex=roiManager("count")-1;
		if(isWholeAxis) call("ij.Prefs.set", "global.wholeAxisRoiIndex",axisROIIndex);
		else call("ij.Prefs.set", "global.synapsisAxisRoiIndex",axisROIIndex);
	}	
	else{
		if (index>-1) {
			tempText="could not find "+window;
			addTableComment(table, tempRow, tempText);
		}	
	}
	if (call("ij.Prefs.get", "global.skeletonize",false)) getSkeleton(table, tempRow, method, isWholeAxis, pixelSize);
	if ((call("ij.Prefs.get","global.measureAxesChannelsIntensities",false)||parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1 ||call("ij.Prefs.get","global.measureFociChannelsIntensities",false))&& call("ij.Prefs.get","global.showAxesValues", false)) {
		if (isWholeAxis) measureAxisIntensities(table, tempRow, image, parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex",-1)), "whole axis");
		else {
			if (call("ij.Prefs.get", "global.synapsisMode","")=="Use synapsed axis channel") tempText="synapsed axis";
			else tempText="non-synapsed axis";
			measureAxisIntensities(table, tempRow, image, parseInt(call("ij.Prefs.get", "global.synapsisAxisRoiIndex",-1)), tempText);
		}
	}	
	close(window+"_"+method);
}

function getPruningParameters(method) {
	if (indexOf(method, "Custom")==-1) {
		call("ij.Prefs.set", "global.processingCycles", 2);
		if (call("ij.Prefs.get", "global.usesMultiplePruningMethods",false)&& call("ij.Prefs.get", "global.usePresetPruningMethods", false)) call("ij.Prefs.set", "global.pruningStrength", parseInt(call("ij.Prefs.get", "global.presetPruningStrength", -1)));
		call("ij.Prefs.set", "global.binaryTool2","Nothing");
		if (method=="2x Erosion") {
			call("ij.Prefs.set", "global.binaryTool1","Erode");
			return;
		}
		if (method=="2x [Erosion & Dilation]") {
			call("ij.Prefs.set", "global.binaryTool1","Open");
			return;
		}
		if (method=="2x Erosion then 2x Dilation"){
			call("ij.Prefs.set", "global.binaryTool1","Erode");
			call("ij.Prefs.set", "global.binaryTool2","Dilate");	
			return;
		}
		if (method=="2x Dilation"){
			call("ij.Prefs.set", "global.binaryTool1","Dilate");				
		}
	}
}
				
function processAxisMask(method, image) {	
	if (method=="None") return;
	getPruningParameters(method);
	selectWindow(image);
	run("Specify...", "width="+getWidth()+" height="+getHeight()+" x=0 y=0");
	run("Options...", "iterations="+parseInt(call("ij.Prefs.get", "global.processingCycles", -1))+" count="+parseInt(call("ij.Prefs.get", "global.pruningStrength",-1))+" black pad do="+call("ij.Prefs.get", "global.binaryTool1","")+"");
	if (call("ij.Prefs.get", "global.binaryTool2","")!="Nothing") run("Options...", "iterations="+parseInt(call("ij.Prefs.get", "global.processingCycles", -1))+" count="+parseInt(call("ij.Prefs.get", "global.pruningStrength",-1))+" black pad do="+call("ij.Prefs.get", "global.binaryTool2","")+"");
}

function getSkeleton(table, row, method, isWholeAxis, pixelSize) {
		if (isWholeAxis) {
			tempType="whole axis";
			ROIIndex=parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex",-1));
		}
		else {
			if (call("ij.Prefs.get", "global.synapsisMode","")=="Use synapsed axis channel") tempType="synapsed axis";
			else tempType="non-synapsed axis";
			ROIIndex=parseInt(call("ij.Prefs.get", "global.synapsisAxisRoiIndex",-1));
		}	
	if (ROIIndex>-1) {			
		tempName=tempType+"_"+method;
		selectWindow(tempName);
		column=" "+tempType+" length (um)";
		run("Specify...", "width="+getWidth()+" height="+getHeight()+" x=0 y=0");	
		run("Skeletonize (2D/3D)");
		setThreshold(255, 255);
		run("Create Selection");
		roiManager("add");
		roiManager("select",roiManager("count")-1);
		RoiManager.setGroup(9);
		skeletonName=tempType+" skeleton";
		if (method!="None") skeletonName+=" ("+method+")";
		roiManager("rename", skeletonName);
		if (row>-1) {
			run("Specify...", "width="+getWidth()+" height="+getHeight()+" x=0 y=0");	
			run("Properties...", "channels=1 slices=1 frames=1 unit=pixel pixel_width=1 pixel_height=1 voxel_depth=1.0000000 frame=[1 sec]"); 		
			setThreshold(255, 255);
			if (call("ij.Prefs.get", "global.showRoughValues", false)) {
			axisLength=getValue("Area limit")*pixelSize;
			Table.set("rough"+column, row, axisLength, table);
			Table.update(table);
			}
			if (call("ij.Prefs.get", "global.showFineValues", false)) {
				run("Set Measurements...", "area redirect=None decimal=3");	
				run("Properties...", "channels=1 slices=1 frames=1 unit="+unit+" pixel_width="+pixelWidth+" pixel_height="+pixelHeight+"1 voxel_depth=1.0000000 frame=[1 sec]");
				axisLength=measureSkeletonLength(tempName);
				Table.set("fine"+column, row, axisLength, table);
				Table.update(table);
			}
		}
	}
	else {
		if (isWholeAxis && call("ij.Prefs.get","global.tool", "")=="Measure synapse length") {
			types=newArray(2);
			types[0]=tempType;
			if (call("ij.Prefs.get", "global.synapsisMode","")=="Use synapsed axis channel") types[1]="synapsed axis";
			else types[1]="non-synapsed axis";
		}
		else types=newArray(tempType);
		for (t=0; t<types.length; t++) {
			column=" "+types[t]+" length (um)";
			if (call("ij.Prefs.get", "global.showRoughValues", false)) Table.set("rough"+column, row, "", table);
			if (call("ij.Prefs.get", "global.showFineValues", false))  Table.set("fine"+column, row, "", table);
		}
	}
}

function measureSkeletonLength(image) 
{
    var sqrtOfTwo = sqrt(2);
    var x,y, result;
    result = 0;
    var value,ul,um,ur,l,r,ll,lm,lr;
    var straightCounter, diagonalCounter;
    straightCounter = 0;
    diagonalCounter = 0;
	selectWindow(image);
    for (x=0; x<getWidth(); x++) {
    	for (y=0; y<getHeight(); y++) {
        	value = getPixel(x,y);
		if (value>0) {
			ul = getPixel(x-1, y-1);
			um = getPixel(x, y-1);
			ur = getPixel(x+1, y-1);
			l = getPixel(x-1, y);
			r = getPixel(x+1, y);
			ll = getPixel(x-1, y+1);
			lm = getPixel(x, y+1);
			lr = getPixel(x+1, y+1);
		        if (um>0) straightCounter++; 
		        if (l>0) straightCounter++;
		        if (r>0) straightCounter++;
			if (lm>0) straightCounter++;
			if (ul>0 && l==0 && um==0) diagonalCounter++;
			if (ur>0 && r==0 && um==0) diagonalCounter++;
			if (ll>0 && l==0 && lm==0) diagonalCounter++;
			if (lr>0 && r==0 && lm==0) diagonalCounter++;
            	}
       }
    }
    straightCounter = straightCounter / 2.0;
    diagonalCounter = diagonalCounter / 2.0;
    result = straightCounter + (diagonalCounter * sqrtOfTwo);
    getPixelSize(unit, pw, ph, pd);
    result = result * pw;
    return result;
}

function measureReferenceIntensities(table, row, image){
	channelArraySize=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") channelArraySize++;
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) {
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") channelArraySize+=2;
	}
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelArraySize++;
	channelsToMeasure=newArray(channelArraySize);
	arrayPosition=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		 channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1));
		 arrayPosition++;
		 if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") {
		 	channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1));
		 	arrayPosition++;
		 }
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) {
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") {
			channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannel",-1));
			arrayPosition++;
		}
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") {
			channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannelA",-1));
			channelsToMeasure[arrayPosition+1]=parseInt(call("ij.Prefs.get", "global.fociChannelB",-1));
			arrayPosition+=2;
		}
	}	
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.measurementChannel",-1));
	for (channel=0; channel<channelsToMeasure.length; channel++) {
		tempChannel=channelsToMeasure[channel];
		if ( call("ij.Prefs.get", "global.ROImode","")=="user-defined ROI") tempText=call("ij.Prefs.get", "global.ROImode","");
		else tempText="nucleus";
		measure(channelsToMeasure[channel], table, row, parseInt(call("ij.Prefs.get", "global.validPruningMethods",-1)), parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1)), tempText, image);
	}	
}

function measureAxisIntensities(table, row, image, roiID, roiName){
	if (row<0) return;
	channelArraySize=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") channelArraySize++;
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) { 
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") channelArraySize+=2;
	}
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelArraySize++;
	channelsToMeasure=newArray(channelArraySize);
	arrayPosition=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		 channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1));
		 arrayPosition++;
		 if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") {
		 	channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1));
		 	arrayPosition++;
		 }
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) {
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") {
			channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannel",-1));
			arrayPosition++;
		}
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") {
			channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannelA",-1));
			channelsToMeasure[arrayPosition+1]=parseInt(call("ij.Prefs.get", "global.fociChannelB",-1));
			arrayPosition+=2;
		}
	}	
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.measurementChannel",-1));
	for (channel=0; channel<channelsToMeasure.length; channel++) {
		tempChannel=channelsToMeasure[channel];
		if (roiID==-1) {
			channelParam=getChannelName(tempChannel);
			if (roiName=="nucleus threshold") roiParam="(nucleus)";
			else roiParam="("+roiName+")";
			if (call("ij.Prefs.get", "global.showIntDenValues", false)){
				param=channelParam+ " intDen "+ roiParam;
				Table.set(param, row,"", table);
			}
			if (call("ij.Prefs.get", "global.showMeanValues", false)) {
				param=channelParam+ " mean "+ roiParam;
				Table.set(param, row,"", table);
			}	
		}
		else {
			measure(channelsToMeasure[channel], table, row, 1, roiID, roiName, image);
		}
	}	
}

function getOffAxisRoi(table, index){
	call("ij.Prefs.set", "global.off-axisRoiIndex",-1);
	if (parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex",-1))>-1) {
		roiManager("Select", newArray(0, parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex",-1))));
		roiManager("XOR");
		if (Roi.size>0) {
			roiManager("add");
			roiIndex=roiManager("count")-1;
			call("ij.Prefs.set", "global.off-axisRoiIndex",roiIndex);
			roiManager("select",roiIndex);
			RoiManager.setGroup(7);
			roiManager("rename", "off-axis");
			call("ij.Prefs.set", "global.off-axisRoiIndex",roiIndex);
		}
		else {
			tempText="no off-axis ROI detected";
			addTableComment(table, index, tempText);			
		}
	}
}

function countFoci(letter, table, index, axisType, noiseValue, channelIndex, imageName){
	if (index<0) return;
	if (axisType=="axis") {
		tempText="global.totalFoci"+letter+"RoiIndex";
		call("ij.Prefs.set", tempText, -1);
		tempText="global.axisFoci"+letter+"RoiIndex";
		call("ij.Prefs.set", tempText, -1);
		tempText="global.axisFoci"+letter+"Number";
		call("ij.Prefs.set", tempText, -1);
		if (parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex", -1))==-1) {
			Table.set("axis_foci"+letter, index, "", table);
			fillTable(table, index, "");
			return;
		}	
	}
	else {
		if (axisType=="off-axis"){
			tempText="global.off-axisFoci"+letter+"RoiIndex";
			call("ij.Prefs.set", tempText, -1);
			tempText="global.off-axisFoci"+letter+"Number";
			call("ij.Prefs.set", tempText, -1);
			if (!call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)) {
				tempText="global.totalFoci"+letter+"RoiIndex";
				call("ij.Prefs.set", tempText, -1);
			}
			if (parseInt(call("ij.Prefs.get", "global.off-axisRoiIndex", -1))==-1) {
				Table.set("off-axis_foci"+letter, index, "", table);
				fillTable(table, index, "");
				return;
			}
		}
		else {
			if (axisType=="total") {
				tempText="global.totalFoci"+letter+"RoiIndex";
				call("ij.Prefs.set", tempText, -1);
			}
		}	
	}
	if (call("ij.Prefs.get", "global.colocalisation", false)) {
		tempText="global."+axisType+"Foci"+letter+"colocRoiIndex";
		call("ij.Prefs.set", tempText,-1);
		tempText="global."+axisType+"Foci"+letter+"notColocRoiIndex";
		call("ij.Prefs.set", tempText,-1);
	}
	if ((axisType=="axis" && parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex", -1))>-1)|| (axisType=="off-axis" && parseInt(call("ij.Prefs.get", "global.off-axisRoiIndex", -1))>-1)){
		if (call("ij.Prefs.get", "global.fociDetectionMode","")=="using masks") countFociUsingMasks(letter, table, index, axisType, noiseValue, channelIndex, imageName);
		if (call("ij.Prefs.get", "global.fociDetectionMode","")=="within ROI")  countFociWithinRoi(letter, table, index, axisType, noiseValue, channelIndex, imageName);
	}
	else {
		if(axisType=="total" && parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1))>-1) countFociWithinRoi(letter, table, index, axisType, noiseValue, channelIndex, imageName); 
	}
}

function countFociUsingMasks(letter, table, index, axisType, noiseValue, channelIndex, ImageName) {		
	tempText="global."+axisType+"Foci"+letter+"RoiIndex";
	call("ij.Prefs.set", tempText, -1);	
	if (call("ij.Prefs.get", "global.colocalisation", false)) {
		tempText="global."+axisType+"Foci+"+letter+"colocAreaRoiIndex";
		call("ij.Prefs.set", tempText, -1);
		tempText="global."+axisType+"Foci+"+letter+"notColocAreaRoiIndex";
		call("ij.Prefs.set", tempText, -1);
	}	
	if (axisType=="axis") roiIndex=parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex",-1));
	else {
		if (axisType=="off-axis") roiIndex=parseInt(call("ij.Prefs.get", "global.off-axisRoiIndex",-1));
		else {
			if (axisType="total") roiIndex=parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1));
		}
	}
	selectWindow(imageName);
	getPixelSize(unit, pixelWidth, pixelHeight);
	run("Specify...", "width="+getWidth()+" height="+getHeight()+" x=0 y=0");	
	run("Duplicate...", "duplicate channels="+channelIndex+"");
	windowName="channel"+letter;
	rename(windowName);
	if(call("ij.Prefs.get", "global.fociThreshold","")!="None"){
		roiManager("select", 0);
		setAutoThreshold(""+call("ij.Prefs.get", "global.fociThreshold","")+" dark "+call("ij.Prefs.get", "global.resetStatus","")+"");
		getThreshold(lower, upper);
		tempText="global.foci"+letter+"LowerThresholdValue";
		call("ij.Prefs.set", tempText,lower);
		tempText="global.foci"+letter+"UpperThresholdValue";
		call("ij.Prefs.set", tempText, upper);
		resetThreshold();
	}
	else{
		lower=-1;
		upper=-1;
	}
	roiManager("select", roiIndex);
	setBackgroundColor(0, 0, 0);
	run("Clear Outside");
	roiManager("select", 0);
	limitToThreshold="";
	if(call("ij.Prefs.get", "global.fociThreshold","")!="None"){
		setThreshold(lower, upper);
		limitToThreshold=" above";
	}
	run("Find Maxima...", "prominence="+noiseValue+" strict exclude"+limitToThreshold+" output=Count");
	tempNumber=getResult("Count", nResults()-1);
	tempText="global."+axisType+"Foci"+letter+"Number";
	call("ij.Prefs.set", tempText,tempNumber);
	if (tempNumber!=0) {
		selectWindow(windowName);
		if(call("ij.Prefs.get", "global.fociThreshold","")!="None") setThreshold(lower, upper);
		roiManager("select", 0);
		run("Find Maxima...", "prominence="+noiseValue+" strict exclude"+limitToThreshold+" output=[Point Selection]");
		Table.set(axisType+"_foci"+letter, index, Roi.size, table);
		roiManager("add");
		fociIndex=roiManager("count")-1;
		roiManager("select",fociIndex);
		RoiManager.setGroup(getRoiGroupFromBase(letter, axisType,11));
		roiManager("rename", axisType+"_foci"+letter+" (maxima)");
		tempText="global."+axisType+"Foci"+letter+"RoiIndex";
		call("ij.Prefs.set", tempText, fociIndex);	
		if (call("ij.Prefs.get", "global.colocalisation", false)) getEuclideanDistanceArea(axisType, letter, fociIndex, pixelWidth, imageName);
	}
	else{
		Table.set(axisType+"_foci"+letter, index, 0, table);
		if (call("ij.Prefs.get", "global.colocalisation", false)) {
			tempText="global."+axisType+"Foci+"+letter+"notColocAreaRoiIndex";
			call("ij.Prefs.set", tempText, 0);	
		}
	}
	Table.update(table);
	close(windowName);
}

function countFociWithinRoi(letter, table, index, axisType, noiseValue, channelIndex, ImageName){
	tempText="global."+axisType+"Foci"+letter+"RoiIndex";
	call("ij.Prefs.set", tempText, -1);	
	tempText="global."+axisType+"Foci"+letter+"Number";
	call("ij.Prefs.set", tempText, -1);	
	if (call("ij.Prefs.get", "global.colocalisation", false)) {
		tempText="global."+axisType+"Foci+"+letter+"colocAreaRoiIndex";
		call("ij.Prefs.set", tempText, -1);
		tempText="global."+axisType+"Foci+"+letter+"notColocAreaRoiIndex";
		call("ij.Prefs.set", tempText, -1);
	}	
	selectWindow(imageName);
	getPixelSize(unit, pixelWidth, pixelHeight);
	run("Specify...", "width="+getWidth()+" height="+getHeight()+" x=0 y=0");	
	run("Duplicate...", "duplicate channels="+channelIndex+"");
	windowName="channel"+letter;
	rename(windowName);
	roiManager("select", 0);
	limitToThreshold="";
	if(call("ij.Prefs.get", "global.fociThreshold","")!="None"){
		setAutoThreshold(""+call("ij.Prefs.get", "global.fociThreshold","")+" dark "+call("ij.Prefs.get", "global.resetStatus","")+"");
		getThreshold(lower, upper);
		tempText="global.foci"+letter+"LowerThresholdValue";
		call("ij.Prefs.set", tempText,lower);
		tempText="global.foci"+letter+"UpperThresholdValue";
		call("ij.Prefs.set", tempText, upper);
		limitToThreshold=" above";
	}
	else {
		lower=0;
		upper=0;
	}
	run("Set Measurements...", "area redirect=None decimal=0");
	tempText="global.totalFoci"+letter+"RoiIndex";
	if (call("ij.Prefs.get", tempText,-1)==-1){
		roiManager("select", 0);
		if(call("ij.Prefs.get", "global.fociThreshold","")!="None") setThreshold(lower, upper);
		run("Find Maxima...", "prominence="+noiseValue+" strict exclude"+limitToThreshold+" output=Count");
		totalFociNumber=getResult("Count", nResults()-1);
		if (totalFociNumber!=0) {// some foci found across the whole image
			tempText="global.totalFoci"+letter+"Number";
			call("ij.Prefs.set", tempText, totalFociNumber);	
			if (axisType=="total") {
				tempText="foci"+letter;	
				Table.set(tempText, index, totalFociNumber, table);
			}
			selectWindow(windowName);
			roiManager("select", 0);
			if(call("ij.Prefs.get", "global.fociThreshold","")!="None") setThreshold(lower, upper);
			run("Find Maxima...", "prominence="+noiseValue+" strict exclude"+limitToThreshold+" output=[Point Selection]");
			roiManager("add");
			totalFociIndex=roiManager("count")-1;
			tempText="global.totalFoci"+letter+"RoiIndex";
			call("ij.Prefs.set", tempText,totalFociIndex);
			roiManager("select",totalFociIndex);
			RoiManager.setGroup(getRoiGroupFromBase(letter, "total",11));
			tempText="total_foci"+letter+" (maxima)";
			roiManager("rename", tempText);
			if (call("ij.Prefs.get", "global.colocalisation", false)&& axisType=="total") getEuclideanDistanceArea(axisType, letter, totalFociIndex, pixelWidth, imageName);
		}
		else {
			roiManager("deselect");
			if (axisType=="axis" || axisType=="off-axis") tempText=axisType+"_foci"+letter;
			else {
				if(axisType=="total") tempText="foci"+letter;	
				}
			Table.set(tempText, index, 0, table);
			if (call("ij.Prefs.get", "global.colocalisation", false)) {
				tempText="global."+axisType+"Foci+"+letter+"notColocAreaRoiIndex";
				call("ij.Prefs.set", tempText, 0);	
			}	
		}
	}
	if (axisType=="axis" || axisType=="off-axis") {
		tempText="global.totalFoci"+letter+"RoiIndex";		
		if (call("ij.Prefs.get", tempText,-1)>-1){
			if (axisType=="axis") roiIndex=parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex",-1));
			else {
				if(axisType=="off-axis") roiIndex=parseInt(call("ij.Prefs.get", "global.off-axisRoiIndex",-1));
			}
			roiManager("Select", newArray(roiIndex, parseInt(call("ij.Prefs.get", tempText,-1))));
			roiManager("AND");
			if (Roi.size>0) {
				tempText="global."+axisType+"Foci"+letter+"Number";
				call("ij.Prefs.set", tempText,Roi.size);
				roiManager("add");
				fociIndex=roiManager("count")-1;
				roiManager("select", fociIndex);
				RoiManager.setGroup(getRoiGroupFromBase(letter, axisType,11));
				roiManager("rename", axisType+"_foci"+letter+" (maxima)");
				tempText="global."+axisType+"Foci"+letter+"RoiIndex";
				call("ij.Prefs.set", tempText, fociIndex);
				Table.set(axisType+"_foci"+letter, index, Roi.size, table);	
				Table.update(table);
				if (call("ij.Prefs.get", "global.colocalisation", false)) getEuclideanDistanceArea(axisType, letter, fociIndex, pixelWidth, imageName);
			}
			else {
				tempText=axisType+"_foci"+letter;
				Table.set(tempText, index, 0, table);
				tempText="global."+axisType+"Foci"+letter+"Number";
				call("ij.Prefs.set", tempText,0);
				if (call("ij.Prefs.get", "global.colocalisation", false)) {
					tempText="global."+axisType+"Foci+"+letter+"notColocAreaRoiIndex";
					call("ij.Prefs.set", tempText, 0);	
				}
			}	
		}
	}	
	close(windowName);		
	Table.update(table);
}

function getRoiGroupFromBase(letter, type, base) {
	output=base;
	if (type=="axis") output+=2;
	else {
		if(type=="off-axis") output+=4;
	}
	if (letter=="A") output+=6;
	else {
		if (letter=="B") output+=12;
	}
	return(output);
}
function getEuclideanDistanceArea(type, letter, roiIndex, width, image){
	tempName="singlePoints"+letter;
	selectWindow(image);
	roiManager("select", roiIndex);
	run("Create Mask");
	rename(tempName);
	run("Invert");
	run("Options...", "iterations=1 count=3 pad edm=32-bit do=Nothing");
	run("Distance Map");
	tempName="EuclideanDistanceMap_"+type+"Foci"+letter;
	rename(tempName);
	EDMThreshold=parseFloat(call("ij.Prefs.get", "global.colocalisationDistance",-1))/width;
	if (type=="total") tempText="colocalised area foci"+letter;
	else tempText="colocalised area "+type+"_foci"+letter;
	selectWindow(tempName);
	setThreshold(0, EDMThreshold);
	run("Create Selection");
	roiManager("add");
	tempIndex=roiManager("count")-1;
	roiManager("select", tempIndex);
	RoiManager.setGroup(getRoiGroupFromBase(letter, type, 23));
	roiManager("rename", tempText);
	tempText="global."+type+"Foci+"+letter+"colocAreaRoiIndex";
	call("ij.Prefs.set", tempText, tempIndex);
	close(tempName);
	tempName="singlePoints"+letter;
	close(tempName);
	tempText="global."+type+"Foci+"+letter+"colocAreaRoiIndex";
	colocAreaRoiIndex=parseInt(call("ij.Prefs.get", tempText,-1));
	roiManager("Select", newArray(0, colocAreaRoiIndex));
	roiManager("XOR");
	if(Roi.size>0) {
		roiManager("add");
		tempIndex=roiManager("count")-1;
		if (type=="total") tempText="not colocalised area foci"+letter;
		else tempText="not colocalised area "+type+"_foci"+letter;
		roiManager("select", tempIndex);
		RoiManager.setGroup(getRoiGroupFromBase(letter, type, 35));
		roiManager("rename", tempText);
		tempText="global."+type+"Foci+"+letter+"notColocAreaRoiIndex";
		call("ij.Prefs.set", tempText, tempIndex);		
	}
}

function findColoc(type, fociLetter, areaLetter, table, tableRow) {
	if ((type=="axis" && parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex", -1))>-1) || (type=="total" && parseInt(call("ij.Prefs.get", "global.referenceRoiIndex", -1))>-1)||(type=="off-axis"&&parseInt(call("ij.Prefs.get", "global.off-axisRoiIndex", -1))>-1)) {
		if (type=="total") {
			tempText="global.totalFoci"+fociLetter+"RoiIndex";
			tempRoiName="colocalised foci"+fociLetter+" (maxima)";
		}
		else {
			tempText="global."+type+"Foci"+fociLetter+"RoiIndex";
			tempRoiName="colocalised "+type+"_foci"+fociLetter+" (maxima)";
		}	
		realFociRoiIndex=parseInt(call("ij.Prefs.get", tempText,-1));
		nColoc=getColoc(realFociRoiIndex, true, false, type, fociLetter, areaLetter, tempRoiName);
		if (type=="total") tempText="colocalised foci"+fociLetter;
		else tempText="colocalised "+type+"_foci"+fociLetter;
		Table.set(tempText, tableRow, nColoc, table);
		Table.update(table);
		return(nColoc);	
	}
	else return(-1);
}
	
function getColoc(roiIndex, show, isRandom, type, fociLetter, areaLetter, roiName) {			
	tempText="global."+type+"Foci+"+areaLetter+"colocAreaRoiIndex";
	colocAreaRoiIndex=parseInt(call("ij.Prefs.get", tempText,-1));
	roiManager("select", newArray(roiIndex, colocAreaRoiIndex));
	roiManager("AND");
	output=Roi.size;
	if (Roi.size>0 && show) {
		tempText="global."+type+"Foci"+fociLetter+"colocRoiIndex";
		roiManager("add");
		tempRoiIndex=roiManager("count")-1;
		roiManager("select", tempRoiIndex);
		if (isRandom) RoiManager.setGroup(getRoiGroupFromBase(fociLetter, type, 83));
		else RoiManager.setGroup(getRoiGroupFromBase(fociLetter, type, 59));
		roiManager("rename", roiName);
		if (!isRandom) call("ij.Prefs.set", tempText, tempRoiIndex);
	}
	if (!isRandom && show) {
		tempText="global."+type+"Foci+"+areaLetter+"notColocAreaRoiIndex";
		notColocAreaRoiIndex=parseInt(call("ij.Prefs.get", tempText,-1));
		roiManager("Select", newArray(roiIndex, notColocAreaRoiIndex));
		roiManager("AND");
		if(Roi.size>0) {
			tempText="global."+type+"Foci"+fociLetter+"notColocRoiIndex";
			roiManager("add");
			tempRoiIndex=roiManager("count")-1;
			roiManager("select", tempRoiIndex);
			RoiManager.setGroup(getRoiGroupFromBase(fociLetter, type, 71));
			roiManager("rename", "not "+roiName);
			call("ij.Prefs.set", tempText, tempRoiIndex);
		}
	}
	return(output);
}

function generateRandomColocValue(type, fociLetter, areaLetter, table, index, realColocValue, imageName){
	if ((type=="total" && parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1))>-1)|| (type=="axis" && parseInt(call("ij.Prefs.get", "global.wholeAxisRoiIndex", -1))>-1)||(type=="off-axis" && parseInt(call("ij.Prefs.get", "global.off-axisRoiIndex", -1))>-1)) {
		tempText="global."+type+"Foci"+fociLetter+"Number";
		nFoci=parseInt(call("ij.Prefs.get", tempText, -1));
		randomCycles=parseInt(call("ij.Prefs.get", "global.randomCycles",-1));
		randomisation=newArray(randomCycles);
		for (i=0; i<randomCycles; i++) randomisation[i]=-1;
		if (type=="axis") roiManager("select", call("ij.Prefs.get", "global.wholeAxisRoiIndex",-1));
		else {
			if (type=="off-axis") roiManager("select", call("ij.Prefs.get", "global.off-axisRoiIndex",-1));
			else {
				if (type=="total") roiManager("select", call("ij.Prefs.get", "global.referenceRoiIndex",-1));
			}
		}
		Roi.getContainedPoints(xpoints, ypoints);
		RoiXPoints=xpoints;
		RoiYPoints=ypoints;
		randomX=newArray(nFoci);
		randomY=newArray(nFoci);
		for (j=0; j<randomCycles; j++){
			randomRanks=getRandomFociRanks(nFoci,RoiXPoints.length);
			for (i=0; i<nFoci; i++) {
				randomX[i]=RoiXPoints[randomRanks[i]];
				randomY[i]=RoiYPoints[randomRanks[i]];
			}
			makeSelection("point", randomX, randomY);
			roiManager("add");
			roiManager("select",roiManager("count")-1);
			if (j<parseInt(call("ij.Prefs.get", "global.maxRandomDistributionToShow",-1))) RoiManager.setGroup(getRoiGroupFromBase(fociLetter, type, 47));
			if (type=="total") tempRoiName="random foci"+fociLetter+"_"+j+" (maxima)";
			else tempRoiName= "random "+type+"_foci"+fociLetter+"_"+j+" (maxima)";
			roiManager("rename", tempRoiName);
			if (type=="total") tempRoiName="colocalised random foci"+fociLetter+"_"+j+" (maxima)";
			else tempRoiName="colocalised random "+type+"_foci"+fociLetter+"_"+j+" (maxima)";
			if (j<parseInt(call("ij.Prefs.get", "global.maxRandomDistributionToShow",-1))) randomisation[j]=getColoc(roiManager("count")-1, true, true, type, fociLetter, areaLetter, tempRoiName);
			else randomisation[j]=getColoc(roiManager("count")-1, false, true, type, fociLetter, areaLetter, tempRoiName);
			print("j: "+j+", "+randomisation[j]);
		}
		randomValuesDistribution=getDistribution(randomisation);
		if (randomValuesDistribution.length==0) {
			tableValue="0 (& no p value calculated)"; 
			if (type=="total") column="Mean randomly colocalised foci"+fociLetter;
			else column="Mean randomly colocalised "+type+"_foci"+fociLetter;
			Table.set(column, index, tableValue, table);
			Table.update(table);
			return;
		}
		else {
			if (call("ij.Prefs.get", "global.showPValue", false))
				{
				colocValues=newArray(randomValuesDistribution.length);
				for(i=0; i<randomValuesDistribution.length; i++) colocValues[i]=i;
				Fit.doFit("Gaussian", colocValues, randomValuesDistribution);
				rSquared=Fit.rSquared;
				Array.getStatistics(randomisation, min, max);
				XMax=Math.round((Math.max(max, realColocValue)*1.3));
				Array.getStatistics(randomValuesDistribution, min, max);
				mostFrequent=max;
				YMax=Math.round(mostFrequent*1.3);
				xPlotValues=newArray(XMax);
				yPlotValues=newArray(XMax);
				for (i=0; i< XMax; i++) {
					xPlotValues[i]=i;
					yPlotValues[i]=Fit.f(i);
				}
				if (type=="total") {
					plotName="Mean randomly colocalised foci"+fociLetter+" distribution";
					plotXAxis="number of randomly colocalised foci";
				}
				else {
					plotName="Mean randomly colocalised "+type+"_foci"+fociLetter+" distribution";
					plotXAxis="number of randomly colocalised "+type+" foci";
				}
				
				Plot.create(plotName, plotXAxis, "frequency");
				Plot.setLimits(0, XMax, 0, YMax);
				Plot.setColor("blue");
				Plot.add("line", xPlotValues, yPlotValues);
				Plot.setColor("lightGray");
				Plot.add("circles", colocValues, randomValuesDistribution);
				Plot.setColor("red");
				Plot.drawLine(realColocValue, 0, realColocValue, mostFrequent);
				text=""+realColocValue+" observed colocalised foci";
				Plot.setColor("black");
				Plot.addText(text, realColocValue, mostFrequent);
				text="r2="+rSquared;
				Plot.addText(text, 2, 2);
				Plot.show();
				path=call("ij.Prefs.get", "global.controlFolder","")+File.separator+plotName+"_"+imageName;
				selectWindow(plotName);
				saveAs("Tiff",path);
				close();
			}
		Array.getStatistics(randomisation, min, max, mean, stdDev);
		reference=mean-(3*stdDev);
		if (!call("ij.Prefs.get", "global.showPValue", false)) {
			tableValue=""+mean;
		}
		else {
			pValue=getPValue(realColocValue, mean, stdDev);
			tableValue=""+mean+" (pValue: "+pValue;
			if (reference<=0) {
				tableValue+="*)";
				if (!call("ij.Prefs.get", "global.pValueErrorMessageShown", false)) {
					call("ij.Prefs.set", "global.pValueErrorMessageShown", true);
					addTableComment(table, index, "* take pValue with caution");
				}
			}
			else tableValue+=")";
		}
		if (type=="total") column="Mean randomly colocalised foci"+fociLetter;
		else column="Mean randomly colocalised "+type+"_foci"+fociLetter;
		Table.set(column, index, tableValue, table);
		Table.update(table);
		}
	}
	else {
		if (type=="total") column="Mean randomly colocalised foci"+fociLetter;
		else column="Mean randomly colocalised "+type+"_foci"+fociLetter;
		Table.set(column, index, "n/a", table);
		Table.update(table);
		return;
	}
}

function getRandomFociRanks(nFoci, nROIPoints){
	randomFociRanks=newArray(nFoci);
	for (i=0; i<nFoci; i++) randomFociRanks[i]=-1;
	for(i=0; i<nFoci; i++) {
		do {
			rank=round(random*nROIPoints);
		}
	while (isAlreadyUsed(rank, randomFociRanks)==true|| rank==nROIPoints);
	randomFociRanks[i]=rank;	
	}
	return randomFociRanks;
}

function isAlreadyUsed(testRank,alreadyUsedRanks){
	for (i=0; i<alreadyUsedRanks.length; i++) {
		if (alreadyUsedRanks[i]==rank) return(true);
	}
	return(false);
}

function getDistribution(array){
	Array.getStatistics(array, min, max, mean, stdDev);
	output=newArray(max);
	for (i=0; i<max; i++){
		freq=0;
		for (j=0; j<array.length;j++) if (array[j]==i) freq++;
		output[i]=freq;
	}
	return output;
}

function getPValue(realColocFoci, meanRandomColocFoci, stDevRandomColocFoci) {
/*uses a Gaussian distribution defined by its mean and its standard derivation. This is a quantile.
	           1 + erf( (realColocFoci - meanRandomColocFoci) / (sqrt(2) * stDevRandomColocFoci) )
	PValue = ----------------------------------------------------------------------------------
*/	                                                    2	
	invSqrtTwo = 1.0 / Math.sqrt(2); 
	phi=0.5 * (1.0 + erf((realColocFoci-meanRandomColocFoci)/ (Math.sqrt(2)*stDevRandomColocFoci)));
	return phi;
}

function erf(value) {
	t = 1.0 / (1.0 + 0.5 * Math.abs(value));
	// uses Horner's method
	output = 1 - t * Math.exp( -value*value - 1.26551223 + t * ( 1.00002368 + t * ( 0.37409196 + t * ( 0.09678418 + t * (-0.18628806 + t * ( 0.27886807 + t * (-1.13520398 + t * ( 1.48851587 + t * (-0.82215223 + t * ( 0.17087277))))))))));
	if (value >= 0)	return  output;
	else return -output;
}

function analyseParticles(image, summaryTable, summaryTableRow, particleTable, currentParticleTableRow) {
	if (call("ij.Prefs.get", "global.tool", "")=="Count axis/off-axis foci in two channels and colocalize"|| call("ij.Prefs.get", "global.tool", "")=="Count foci in two channels and colocalize") tempLetters=newArray("A","B");
	else tempLetters=newArray("");
	if (call("ij.Prefs.get", "global.colocalisation",false)) tempColocStatuses=newArray("coloc", "notColoc");
	else tempColocStatuses=newArray("");
	if (call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)) tempTypes=newArray("axis", "off-axis");
	else tempTypes=newArray(call("ij.Prefs.get", "global.fociType",""));
	for (l=0; l<tempLetters.length; l++) {
		proceed=false;
		for (t=0; t<tempTypes.length; t++) {
			tempText="global."+tempTypes[t]+"Foci"+tempLetters[l]+"RoiIndex";
			if (parseInt(call("ij.Prefs.get", tempText, -1))==-1) {// no type maxima found
				for (cs=0; cs<tempColocStatuses.length; cs++) {
					if (tempTypes[0]=="total") setMeasurementsToBlank("", tempLetters[l], tempColocStatuses[cs], summaryTable, summaryTableRow, "particle");
					else setMeasurementsToBlank(tempTypes[t], tempLetters[l], tempColocStatuses[cs], summaryTable, summaryTableRow, "particle");
				}
			}
			else proceed=true;
		}	
		if (proceed) {// some maxima are found and it's worth generating raw particles
			getRawTotalParticles(tempLetters[l], image); 
   			currentParticleTableRow=getIndividualParticles(call("ij.Prefs.get", "global.fociType",""), tempLetters[l], image, summaryTable, summaryTableRow, particleTable, currentParticleTableRow); // getIndividualParticles and measure them if needed
   			for (t=0; t<tempTypes.length; t++) {
   				for (cs=0; cs<tempColocStatuses.length; cs++) {
   					if (call("ij.Prefs.get", "global.showParticleValues",false)) measureFociParticlesIntensities(tempTypes[t], tempLetters[l], tempColocStatuses[cs], summaryTable, summaryTableRow, image);
					if (call("ij.Prefs.get", "global.showMaximumValues",false))  measureFociMaximaIntensities(tempTypes[t], tempLetters[l], tempColocStatuses[cs], summaryTable, summaryTableRow, image);
   				}
			}
		}
	}	
	return(currentParticleTableRow);	
}		

function analyseMaxima(image, summaryTable, summaryTableRow) {
	if (call("ij.Prefs.get", "global.tool", "")=="Count axis/off-axis foci in two channels and colocalize"|| call("ij.Prefs.get", "global.tool", "")=="Count foci in two channels and colocalize") tempLetters=newArray("A","B");
	else tempLetters=newArray("");
	if (call("ij.Prefs.get", "global.colocalisation",false)) tempColocStatuses=newArray("coloc", "notColoc");
	else tempColocStatuses=newArray("");
	if (call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)) tempTypes=newArray("axis", "off-axis");
	else tempTypes=newArray(call("ij.Prefs.get", "global.fociType",""));
	for (l=0; l<tempLetters.length; l++) {
		proceed=false;
		for (t=0; t<tempTypes.length; t++) {
			tempText="global."+tempTypes[t]+"Foci"+tempLetters[l]+"RoiIndex";
			if (parseInt(call("ij.Prefs.get", tempText, -1))==-1) {// no type maxima found
				for (cs=0; cs<tempColocStatuses.length; cs++) {
					if (tempTypes[0]=="total") setMeasurementsToBlank("", tempLetters[l], tempColocStatuses[cs], summaryTable, summaryTableRow, "maximum");
					else {
						setMeasurementsToBlank(tempTypes[t], tempLetters[l], tempColocStatuses[cs], summaryTable, summaryTableRow, "maximum");
					}
				}
			}
			else proceed=true;
		}	
		if (proceed) {// some maxima are found and it's worth generating raw particles
     		for (t=0; t<tempTypes.length; t++) {
   				for (cs=0; cs<tempColocStatuses.length; cs++) {
					if (call("ij.Prefs.get", "global.showMaximumValues",false))  measureFociMaximaIntensities(tempTypes[t], tempLetters[l], tempColocStatuses[cs], summaryTable, summaryTableRow, image);
				}
     		}	
		}
	}	
}

function getRawTotalParticles(letter, image) {	
	tempText="global.rawTotalFoci"+letter+"ParticleRoiIndex";
	call("ij.Prefs.set", tempText, -1);
	selectWindow(image);
	tempText="global.fociChannel"+letter;
	tempChannel=parseInt(call("ij.Prefs.get", tempText, -1));	
	run("Specify...", "width="+getWidth()+" height="+getHeight()+" x=0 y=0");	
	run("Duplicate...", "duplicate channels="+tempChannel+"");
	windowName="channel"+letter;
	rename(windowName);
	roiManager("select", 0);
		tempText="global.noise"+letter;
		tempNoise=parseInt(call("ij.Prefs.get", tempText, -1));
	if(call("ij.Prefs.get", "global.fociThreshold","")!="None") {
		tempText="global.foci"+letter+"LowerThresholdValue";
		tempLower=parseFloat(call("ij.Prefs.get", tempText, -1));
		tempText="global.foci"+letter+"UpperThresholdValue";
		tempUpper=parseFloat(call("ij.Prefs.get", tempText, -1));
		setThreshold(tempLower, tempUpper);
		run("Find Maxima...", "prominence="+tempNoise+" strict exclude above output=[Segmented Particles]");
	}
	else run("Find Maxima...", "prominence="+tempNoise+" strict exclude output=[Maxima Within Tolerance]");
	tempName=image+"_particles";
	rename(tempName);
	setThreshold(255, 255);
	if (getValue("Area limit")>0) {
		run("Create Selection");
		roiManager("add");
		particleIndex=roiManager("count")-1;
		roiManager("select",particleIndex);
		roiManager("rename", "raw total_foci"+letter+" (particles)");
		tempText="global.rawTotalFoci"+letter+"ParticleRoiIndex";
		call("ij.Prefs.set", tempText, particleIndex);	
		}
	close(tempName);
	close(windowName);
}

function getIndividualParticles(type, letter, imageName, summaryTable, summaryRow, particleTable, currentParticleTableRow){
	if (type=="axis") antiType="off-axis";
	else {
		if (type=="off-axis") antiType="axis";
	}
	rawFociTempText="global.rawTotalFoci"+letter+"ParticleRoiIndex";
	if (parseInt(call("ij.Prefs.get", rawFociTempText, -1))==-1) return (currentParticleTableRow); // no raw particle found
	else{
		if (type=="total") {
			tempText="global.totalFoci"+letter+"RoiIndex";
			if (parseInt(call("ij.Prefs.get", tempText, -1))==-1) return(currentParticleTableRow);
		}
		else {
			tempText="global."+type+"Foci"+letter+"RoiIndex";
			if (parseInt(call("ij.Prefs.get", tempText, -1))==-1&&!call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)) return (currentParticleTableRow);
			antiTempText="global."+antiType+"Foci"+letter+"RoiIndex";
			if (parseInt(call("ij.Prefs.get", tempText, -1))==-1&&call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)&&parseInt(call("ij.Prefs.get", antiTempText, -1))==-1) return (currentParticleTableRow);
		}
		firstParticleRoi=roiManager("count");
		roiManager("select",call("ij.Prefs.get", rawFociTempText, -1));
		if (Roi.getType=="composite") {// multiple foci initially identified
			roiManager("Split");
		}
		else roiManager("add");// one single foci initially identified
		lastParticleRoi=roiManager("count")-1;		
		if(lastParticleRoi<firstParticleRoi) return (currentParticleTableRow);
		else{
			nType=0;
			nUnknown=0;
			if (call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)) nAntiType=0;
			nParticles=lastParticleRoi-firstParticleRoi+1;// number of initially identified particles, some not corresponding to an identified maximum
			roisTypes=newArray(nParticles);
			counter=0;
			for (particleRoi=firstParticleRoi; particleRoi<lastParticleRoi+1; particleRoi++){
				maximumRoi=-1;
				maximaTempText="global."+type+"Foci"+letter+"RoiIndex";
				if (parseInt(call("ij.Prefs.get", maximaTempText, -1))>-1) {// some type maximum initially identified
					roiManager("select", newArray(particleRoi, parseInt(call("ij.Prefs.get", maximaTempText, -1))));
					roiManager("AND");
					if (Roi.size>0) {// is a type particle
						roisTypes[counter]=type;
						if (call("ij.Prefs.get", "global.showIndividualFoci",false)) {
							roiManager("add");
							maximumRoi=roiManager("count")-1;
							roiManager("select", maximumRoi);// corresponding type maximum added
							if (type=="total")roiManager("rename", "foci"+letter+"_"+nType+" (maximum)");
							else roiManager("rename", type+"_foci"+letter+"_"+nType+" (maximum)");
						}
						else roiManager("deselect");	
						if (call("ij.Prefs.get", "global.colocalisation",false)&&(call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize")){
							altLetter="B";
							if (letter=="B") altLetter="A";
							areaTempText="global."+type+"Foci+"+altLetter+"colocAreaRoiIndex";
							if (parseInt(call("ij.Prefs.get", areaTempText, -1))==-1) {// no altLetter foci initially identified, colocStatus set to ""
								if (call("ij.Prefs.get", "global.showIndividualFoci",false)) {
									roiManager("select", maximumRoi);
									RoiManager.setGroup(getRoiGroupFromBinary(type, letter, "", "maximum"));
								}	
								roiManager("select", particleRoi);
								RoiManager.setGroup(getRoiGroupFromBinary(type, letter, "", "particle"));
							}
							else {
								roiManager("select", newArray(particleRoi, parseInt(call("ij.Prefs.get", maximaTempText, -1)), parseInt(call("ij.Prefs.get", areaTempText, -1))));
								roiManager("AND");
								if (Roi.size>0) {// corresponding maximum is located within the thresholded euclidean Map area and colocstatus set to "colocalised"
									roiManager("deselect");
									if (call("ij.Prefs.get", "global.showIndividualFoci",false)) {
										roiManager("select", maximumRoi);
										RoiManager.setGroup(getRoiGroupFromBinary(type, letter, "colocalised", "maximum"));
									}
									roiManager("select", particleRoi);
									RoiManager.setGroup(getRoiGroupFromBinary(type, letter, "colocalised", "particle"));
								}
								else {// corresponding maximum is not located within the thresholded euclidean Map area and colocstatus set to "not colocalised"
									roiManager("deselect");
									if (call("ij.Prefs.get", "global.showIndividualFoci",false)) {
										roiManager("select", maximumRoi);
										RoiManager.setGroup(getRoiGroupFromBinary(type, letter, "not colocalised", "maximum"));
									}
									roiManager("select", particleRoi);
									RoiManager.setGroup(getRoiGroupFromBinary(type, letter, "not colocalised", "particle"));
								}
							}
						}
						else {// corresponding maximum colocstatus set to "" as no colocalisation analysis is requested
							roiManager("deselect");	
							if (call("ij.Prefs.get", "global.showIndividualFoci",false)) {
								roiManager("select", maximumRoi);
								RoiManager.setGroup(getRoiGroupFromBinary(type, letter, "", "maximum"));
							}
							roiManager("select", particleRoi);
							RoiManager.setGroup(getRoiGroupFromBinary(type, letter, "", "particle"));
						}
						roiManager("select", particleRoi);
						if (type=="total") tempRoiName="foci"+letter+"_"+nType+" (particle)";
						else tempRoiName=type+"_foci"+letter+"_"+nType+" (particle)";
						roiManager("rename", tempRoiName);
						
						if(call("ij.Prefs.get", "global.showIndividualFoci", false)){
							if (call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)) measureIndividualFociIntensities(maximumRoi, particleRoi, currentParticleTableRow, nType+nAntiType, particleTable, imageName);
							else measureIndividualFociIntensities(maximumRoi, particleRoi, currentParticleTableRow, nType, particleTable, imageName);
						}						
						nType++;					
					}
				}	
				roiManager("select", particleRoi);
				if (Roi.getGroup()==parseInt(call("ij.Prefs.get", "global.defaultRoiGroup",-1))) {//the particle was not corresponding to a type maximum 
					if (call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)){// both types and antitypes particles to be identified
						maximaTempText="global."+antiType+"Foci"+letter+"RoiIndex";
						if (parseInt(call("ij.Prefs.get", maximaTempText, -1))>-1){// some antitype maxima initially identified
							roiManager("select", newArray(particleRoi, parseInt(call("ij.Prefs.get", maximaTempText, -1))));
							roiManager("AND");
							if (Roi.size>0) {// the particle correspond to an antitype maximum
								roisTypes[counter]=antiType;
								if(call("ij.Prefs.get", "global.showIndividualFoci", false)) {
									roiManager("add");// corresponding antitype maximum added
									maximumRoi=roiManager("count")-1;
									roiManager("select", maximumRoi);
									RoiManager.setGroup(getRoiGroupFromBinary(antiType, letter, "", "maximum"));
									roiManager("rename", antiType+"_foci"+letter+"_"+nAntiType+" (maximum)");
								}
								else roiManager("deselect");		
								roiManager("select", particleRoi);
								RoiManager.setGroup(getRoiGroupFromBinary(antiType, letter, "", "particle"));
								roiManager("rename", antiType+"_foci"+letter+"_"+nAntiType+" (particle)");
								if(call("ij.Prefs.get", "global.showIndividualFoci", false)) measureIndividualFociIntensities(maximumRoi, particleRoi, currentParticleTableRow, nType+nAntiType, particleTable, imageName);
								nAntiType++;
							}
						}
					}	
				}	
				roiManager("select", particleRoi);
				if (Roi.getGroup()==parseInt(call("ij.Prefs.get", "global.defaultRoiGroup",-1))){// the particle was corresponding neither to a type nor an antitype maximum 
					roisTypes[counter]="unknown";
					nUnknown++;
				}
				counter++;
			}
			
			// all individual particles being analysed from here
			if (call("ij.Prefs.get", "global.toolUsesBothAxisAndOffAxis",false)) {
				getTypeParticles(type, letter, "");
				getTypeParticles(antiType, letter, "");
				return(currentParticleTableRow+nType+nAntiType);
			}
			else {
				if ((call("ij.Prefs.get", "global.colocalisation",false)&&call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize")||(call("ij.Prefs.get", "global.colocalisation",false)&&call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize")) {
					getTypeParticles(type, letter, "coloc");
					getTypeParticles(type, letter, "notColoc");
				}
				else getTypeParticles(type, letter, "");
				return(currentParticleTableRow+nType);
			}
		}
	}
}

function getRoiGroupFromBinary(axisType, letter, colocStatus, fociType) {
	output=0;
	if (fociType=="particle") output+=2;
	if (axisType=="axis") output+=4;
	if (axisType=="off-axis") output+=8;
	if (letter=="A") output+=16;
	if (letter=="B") output+=32;
	if (colocStatus=="colocalised") output+=64;
	if (colocStatus=="not colocalised") output+=128;
	return output;
}

function measureIndividualFociIntensities(maximumRoiIndex, particleRoiIndex, tableRow, ID, table, image){
	axis=4;
	offAxis=8;
	coloc=64;
	notColoc=128;
	A=16;
	B=32;
	roiManager("Select", particleRoiIndex);
	tempParticleRoiGroup=Roi.getGroup();
	roiManager("Select", maximumRoiIndex);
	tempMaximumRoiGroup=Roi.getGroup();
	if ((tempMaximumRoiGroup+2)!=tempParticleRoiGroup) return(tableRow);
	else {
		if((tempParticleRoiGroup&axis)!=0) tempAxisType="axis";
		else {
			if((tempParticleRoiGroup&offAxis)!=0) tempAxisType="off-axis";
			else tempAxisType="";
		}
		if((tempParticleRoiGroup&A)!=0) tempLetter="A";
		else{ 
			if((tempParticleRoiGroup&B)!=0) tempLetter="B";
			else tempLetter="";
		}
		tempRow=tableRow+ID;
		Table.set("Type", tempRow, substring(image,0,indexOf(image,"_")), table);
		Table.set("particleROIIndex", tempRow, particleRoiIndex, table);
		Table.set("maximumROIIndex", tempRow, maximumRoiIndex, table);
		Table.set("Image name",tempRow, substring(image,0,indexOf(image,".")), table);
		Table.set("focus' ID", tempRow, ID, table);
		if (tempAxisType!="total") Table.set("focus' type", tempRow, tempAxisType, table);
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") Table.set("focus' channel", tempRow, tempLetter, table);
		if (call("ij.Prefs.get", "global.colocalisation",false)) {
			if((tempParticleRoiGroup&coloc)!=0) tempColocStatus="yes";
			else{
				if((tempParticleRoiGroup&notColoc)!=0) tempColocStatus="no";
				else tempColocStatus="unknown";
			}
			Table.set("focus' colocalisation status", tempRow, tempColocStatus, table);
		}
		Table.set("Comment", tempRow,"", table);
		channelArraySize=0;
		if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
			channelArraySize++;
			if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") channelArraySize++;
		}
		if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) { 
			if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") channelArraySize++;
			if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize" || call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") channelArraySize+=2;
		}
		if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelArraySize++;
		channelsToMeasure=newArray(channelArraySize);
		arrayPosition=0;
		if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		 	channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1));
		 	arrayPosition++;
		 	if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") {
		 		channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1));
		 		arrayPosition++;
		 	}
		}
		if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) {
			if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") {
				channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannel",-1));
				arrayPosition++;
			}
			if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize" || call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") {
				channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannelA",-1));
				channelsToMeasure[arrayPosition+1]=parseInt(call("ij.Prefs.get", "global.fociChannelB",-1));
				arrayPosition+=2;
			}
		}	
		if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.measurementChannel",-1));
		roiArraySize=0;
		if (call("ij.Prefs.get", "global.showMaximumValues", false)) roiArraySize++;
		if (call("ij.Prefs.get", "global.showParticleValues", false)) roiArraySize++;
		roiIndices=newArray(roiArraySize);
		roiNames=newArray(roiArraySize);
		arrayPosition=0;
		if (call("ij.Prefs.get", "global.showMaximumValues", false)) {
			roiIndices[arrayPosition]=maximumRoiIndex;
			roiNames[arrayPosition]="focus' maximum";
			arrayPosition++;
		}
		if (call("ij.Prefs.get", "global.showParticleValues", false)) {
			roiIndices[arrayPosition]=particleRoiIndex;
			roiNames[arrayPosition]="focus' particle";
			arrayPosition++;
		}
			
		for (channel=0; channel<channelsToMeasure.length; channel++) {
			tempChannel=channelsToMeasure[channel];
			for (roi=0; roi<roiIndices.length; roi++) {
				tempRoiIndex=roiIndices[roi];
				tempRoiName=roiNames[roi];
				measure(tempChannel, table, tempRow, 1, tempRoiIndex, tempRoiName, image);
			}
		}	
	}
	Table.update(table);
}

function getTypeParticles(type, letter, colocStatus){
	tempText="global."+type+"Foci"+letter+colocStatus+"ParticleRoiIndex";
	call("ij.Prefs.set", tempText, -1);
	if (colocStatus=="") tempColocStatus=""; 
	else {
		if(colocStatus=="coloc") tempColocStatus="colocalised";
		else {
			if (colocStatus=="notColoc") tempColocStatus="not colocalised";
		}
	}
	RoiManager.selectGroup(getRoiGroupFromBinary(type, letter, tempColocStatus, "particle"));
	if (roiManager("index")>-1)	{
		if (colocStatus=="") {
			base=101;
			tempRoiName=type+"_foci"+letter+" (particles)";
		}
		else {
			if (colocStatus=="coloc") {
				tempRoiName="colocalised "+type+"_foci"+letter+" (particles)";
				base=113;
			}
			else {
				if (colocStatus=="notColoc") {
					tempRoiName="not colocalised "+type+"_foci"+letter+" (particles)";
					base=125;
				}
			}
		}
		roiManager("Combine");
 		roiManager("Add");
  		tempRoiIndex=roiManager("count")-1;
		roiManager("select", tempRoiIndex);
		RoiManager.setGroup(getRoiGroupFromBase(letter, type, base));
		roiManager("rename", tempRoiName);
		call("ij.Prefs.set", tempText, tempRoiIndex);
	}
}

function measureFociParticlesIntensities(type, letter, colocStatus, table, row, image) {
	tempText="global."+type+"Foci"+letter+colocStatus+"ParticleRoiIndex";
	tempRoiID=parseInt(call("ij.Prefs.get", tempText, -1));
	tempRoiName="";
	if(colocStatus=="coloc") tempRoiName+="colocalised ";
	else {
		if(colocStatus=="notColoc") tempRoiName+="not colocalised ";
	}
	if (type=="axis"||type=="off-axis") tempRoiName+=type+" ";
	tempRoiName+="foci"+letter;
	tempRoiName+=" particles";
	channelArraySize=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") channelArraySize++;
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) { 
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") channelArraySize+=2;
	}
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelArraySize++;
	channelsToMeasure=newArray(channelArraySize);
	arrayPosition=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1));
		arrayPosition++;
		if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") {
		 	channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1));
		 	arrayPosition++;
		 }
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) {
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") {
			channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannel",-1));
			arrayPosition++;
		}
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") {
			channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannelA",-1));
			channelsToMeasure[arrayPosition+1]=parseInt(call("ij.Prefs.get", "global.fociChannelB",-1));
			arrayPosition+=2;
		}
	}	
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.measurementChannel",-1));
	for (channel=0; channel<channelsToMeasure.length; channel++) {
		if (tempRoiID==-1) {
			channelParam=getChannelName(channelsToMeasure[channel]);
			roiParam="("+tempRoiName+")";
			if (call("ij.Prefs.get", "global.showIntDenValues", false)){
				param=channelParam+ " intDen "+ roiParam;
				Table.set(param, row,"", table);
			}
			if (call("ij.Prefs.get", "global.showMeanValues", false)) {
				param=channelParam+ " mean "+ roiParam;
				Table.set(param, row,"", table);
			}	
		}
		else {
			measure(channelsToMeasure[channel], table, row, 1, tempRoiID, tempRoiName, image);
		}
	}
}

function measureFociMaximaIntensities(type, letter, colocStatus, table, row, image) {
	tempText="global."+type+"Foci"+letter+colocStatus+"RoiIndex";
	tempRoiID=parseInt(call("ij.Prefs.get", tempText, -1));
	tempRoiName="";
	if(colocStatus=="coloc") tempRoiName+="colocalised ";
	else {
		if(colocStatus=="notColoc") tempRoiName+="not colocalised ";
	}
	if (type=="axis"||type=="off-axis") tempRoiName+=type+" ";
	tempRoiName+="foci"+letter;
	tempRoiName+=" maxima";
	channelArraySize=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") channelArraySize++;
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) { 
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") channelArraySize+=2;
	}
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelArraySize++;
	channelsToMeasure=newArray(channelArraySize);
	arrayPosition=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1));
		arrayPosition++;
		if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") {
		 	channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1));
		 	arrayPosition++;
		 }
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) {
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") {
			channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannel",-1));
			arrayPosition++;
		}
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") {
			channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.fociChannelA",-1));
			channelsToMeasure[arrayPosition+1]=parseInt(call("ij.Prefs.get", "global.fociChannelB",-1));
			arrayPosition+=2;
		}
	}	
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))!=-1) channelsToMeasure[arrayPosition]=parseInt(call("ij.Prefs.get", "global.measurementChannel",-1));
	for (channel=0; channel<channelsToMeasure.length; channel++) {
		if (tempRoiID==-1) {
			channelParam=getChannelName(channelsToMeasure[channel]);
			roiParam="("+tempRoiName+")";
			if (call("ij.Prefs.get", "global.showIntDenValues", false)){
				param=channelParam+ " intDen "+ roiParam;
				Table.set(param, row,"", table);
			}
		}
		else measure(channelsToMeasure[channel], table, row, 1, tempRoiID, tempRoiName, image);
	}
}

function setMeasurementsToBlank(type, letter, colocStatus, table, row, fociType){
	if (!call("ij.Prefs.get", "global.showMaximumValues", false)&&fociType=="maximum") return;
	if (!call("ij.Prefs.get", "global.showParticleValues", false)&&fociType=="particle") return;
	channelArraySize=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") channelArraySize++;
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)){
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") channelArraySize++;
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize" || call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") channelArraySize+=2;
	}
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) channelArraySize++;
	channelParam=newArray(channelArraySize);
	channelParamID=0;
	if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
		channelParam[channelParamID]="whole axis ch.";
		channelParamID++;
		if (call("ij.Prefs.get", "global.tool","")=="Measure synapse length") {
			channelParam[channelParamID]=substring(call("ij.Prefs.get", "global.synapsisMode",""), 4, indexOf(call("ij.Prefs.get", "global.synapsisMode",""), " channel"))+" ch.";
			channelParamID++;
		}	
	}
	if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)){
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel") {
			channelParam[channelParamID]="foci ch.";
			channelParamID++;
			}
		if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize") {
			channelParam[channelParamID]="fociA ch.";
			channelParam[channelParamID+1]="fociB ch.";
			channelParamID+=2;
		}
	}
	if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) channelParam[channelParamID]=getChannelName(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1)));		
	tempRoiName="";
	if(colocStatus=="coloc") tempRoiName+="colocalised ";
	else {
		if(colocStatus=="notColoc") tempRoiName+="not colocalised ";
	}
	
	if (type=="axis"||type=="off-axis") tempRoiName+=type+" ";
	tempRoiName+="foci"+letter;
	if (fociType=="maximum") tempRoiName+=" maxima";
	if (fociType=="particle") tempRoiName+=" particles";
	roiParam="("+tempRoiName+")";
	for(channel=0; 	channel<channelParam.length; channel++) {
		if (call("ij.Prefs.get", "global.showIntDenValues", false)){
			param=channelParam[channel]+" intDen "+roiParam;
			Table.set(param,row,"", table);
		}	
		if (call("ij.Prefs.get", "global.showMeanValues", false)&& fociType!="maximum") {
			param=channelParam[channel]+" mean "+roiParam;
			Table.set(param,row,"", table);
		}
	}
}

function purgeRois() {
	if (call("ij.Prefs.get", "global.debugMode", false)) return;
	if (roiManager("count")==0) return;
	toDeleteRoiGroups=newArray(1);
	if (!call("ij.Prefs.get", "global.showIndividualFoci", false)) {
		if (call("ij.Prefs.get", "global.tool", "")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool", "")=="Count foci in two channels and colocalize") {
			if (call("ij.Prefs.get", "global.colocalisation",false)) toDeleteRoiGroups=newArray(9);
			else toDeleteRoiGroups=newArray(5);
		}
		else {
			if (call("ij.Prefs.get","global.tool", "")=="Count axis and off-axis foci in one channel") toDeleteRoiGroups=newArray(5);
		}
	}
	toDeleteRoiGroups[0]=parseInt(call("ij.Prefs.get", "global.defaultRoiGroup",-1));
	if (!call("ij.Prefs.get", "global.showIndividualFoci", false)) {
		tempFociTypes=newArray("maximum", "particle");
		if ((call("ij.Prefs.get", "global.tool", "")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool", "")=="Count foci in two channels and colocalize")&&call("ij.Prefs.get", "global.colocalisation",false)) tempColocStatus=newArray("colocalised", "not colocalised");
		else tempColocStatus=newArray("unknown");
		if (call("ij.Prefs.get", "global.tool", "")=="Count foci in two channels and colocalize") tempTypes=newArray("total");
		else {
			if (call("ij.Prefs.get", "global.tool", "")=="Count axis/off-axis foci in two channels and colocalize") tempTypes=newArray(call("ij.Prefs.get", "global.fociType",""));
			else {
				if (call("ij.Prefs.get","global.tool", "")=="Count axis and off-axis foci in one channel") tempTypes=newArray("axis", "off-axis");
			}
		}
		if (call("ij.Prefs.get", "global.tool", "")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool", "")=="Count foci in two channels and colocalize") tempLetters=newArray("A", "B");
		else {
			if (call("ij.Prefs.get","global.tool", "")=="Count axis and off-axis foci in one channel") tempLetters=newArray("");
		}
		counter=1;
		do {
			for(ft=0; ft<tempFociTypes.length; ft++){
				for (cs=0; cs<tempColocStatus.length; cs++){
					for (t=0; t<tempTypes.length; t++){
						for(l=0; l<tempLetters.length; l++) {
							toDeleteRoiGroups[counter]=getRoiGroupFromBinary(tempTypes[t], tempLetters[l], tempColocStatus[cs], tempFociTypes[ft]);
							counter++;
						}
					}
				}
			}	
		}
		while (counter<toDeleteRoiGroups.length);
	}
	for(i=0; i<toDeleteRoiGroups.length; i++) {
		RoiManager.selectGroup(toDeleteRoiGroups[i]);
		if (roiManager("index")>-1)	roiManager("delete");
	}
}			
									
function saveRois(string){
	if (roiManager("count")==0) return;
	prefix="";
	if (call("ij.Prefs.get", "global.tool", "")=="Count axis/off-axis foci in two channels and colocalize") prefix="2"+call("ij.Prefs.get", "global.fociType","")+"Foci";
	if (call("ij.Prefs.get", "global.tool", "")=="Count foci in two channels and colocalize") prefix="2Foci";
	if (call("ij.Prefs.get","global.tool", "")=="Count axis and off-axis foci in one channel") prefix="foci";
	if (call("ij.Prefs.get","global.tool", "")=="Measure synapse length") prefix="synapse";
	if (call("ij.Prefs.get","global.tool", "")=="Measure axis length") prefix="lengths";
	if (call("ij.Prefs.get","global.tool", "")=="Measure Global intensities") prefix="intensities";
	if (call("ij.Prefs.get","global.tool", "")=="Set advanced user parameters") prefix="pruning";
	zipPath=call("ij.Prefs.get", "global.controlFolder","")+prefix+"_RoiSet_"+replace(string,".tif", ".zip");
	roiManager("Save", zipPath);
}

function burnParameters(table, lastRow){
	row=0;
	Table.set("Parameter", row, "Smooth original images", table);
	if (call("ij.Prefs.get", "global.smooth",false)) Table.set("Value", row, "yes", table);
	else Table.set("Value", row, "no", table);
	row++;
	Table.set("Parameter", row, "ROI chosen", table);
	if (call("ij.Prefs.get", "global.ROImode","")=="user-defined ROI") {
		Table.set("Value", row, "user-defined", table);
		row++;
	}
	else {
		Table.set("Value", row, "nucleus", table);
		Table.set("Parameter", row+1, "nucleus channel", table);
		Table.set("Value", row+1, parseInt(call("ij.Prefs.get", "global.nucleusChannel",-1)), table);
		Table.set("Parameter", row+2, "nucleus threshold type", table);
		Table.set("Value", row+2, call("ij.Prefs.get", "global.nucleusThreshold",""), table);
		row=row+3;	
	}
	if (call("ij.Prefs.get","global.tool", "")=="Measure Global intensities"){
		for(i=1; i<	call("ij.Prefs.get", "global.channelsNumber",-1)+1; i++) {
			tempText="global.measureChannel"+i;
			Table.set("Parameter", row, "Channel "+i+" analysed", table);
			if(call("ij.Prefs.get", tempText, true)) Table.set("Value", row,"yes", table);
			else Table.set("Value", row,"no", table);
			row++;
		}
	}
	else{
		if (call("ij.Prefs.get", "global.tool","")!="Count foci in two channels and colocalize") {
			Table.set("Parameter", row, "Axis channel", table);
			Table.set("Value",row, parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1)), table);
			Table.set("Parameter", row+1, "Axis Threshold", table);
			Table.set("Value",row+1,call("ij.Prefs.get", "global.axisThreshold",""), table);
			Table.set("Parameter", row+2, "Axis Min size", table);
			Table.set("Value",row+2, parseInt(call("ij.Prefs.get", "global.smallestSize", -1)), table);
			Table.set("Parameter", row+3, "Axis Max Circ.", table);
			Table.set("Value",row+3, call("ij.Prefs.get", "global.circ", -1), table);
			Table.set("Parameter", row+4, "Exclude edge-touching axis", table);
			if (call("ij.Prefs.get", "global.exclude", false)) Table.set("Value",row+4, "yes", table);
			else Table.set("Value",row+4, "no", table);
			row=row+5;
			Table.set("Parameter", row, "Measure axis length", table);
			if (call("ij.Prefs.get", "global.skeletonize",false)) Table.set("Value",row, "yes", table);
			else Table.set("Value",row, "no", table);
			row++;
			if (call("ij.Prefs.get","global.tool", "")=="Measure axis length"){
				Table.set("Parameter",row, "Measure axis' ROI intensity", table);
				tempText="";
				if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) tempText+="Ch. "+parseInt(call("ij.Prefs.get", "global.measurementChannel",-1));
				if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
				if (tempText=="") tempText+="axis channel (Ch."+parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))+")";
				else tempText+=" & axis channel (Ch."+parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))+")";	
				}
				if (tempText=="") tempText="no";
				Table.set ("Value", row, tempText, table);
				row++;
			}
			if (call("ij.Prefs.get","global.tool", "")=="Measure synapse length"){
				Table.set("Parameter", row, "Synapsis reference", table);
				if (call("ij.Prefs.get", "global.synapsisMode","")=="Use synapsed axis channel") synapseMode="synapsed";
				else synapseMode="non-synapsed";
				Table.set("Value",row, synapseMode, table);
				Table.set("Parameter", row+1, synapseMode+" axis channel", table);
				Table.set("Value",row+1, parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1)), table);	
				row=row+2;
				Table.set("Parameter",row, "Measure axis' and "+synapseMode+" axis' ROIs intensities", table);
				tempText="";
				if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) tempText+="Ch. "+parseInt(call("ij.Prefs.get", "global.measurementChannel",-1));
				if (call("ij.Prefs.get", "global.measureAxesChannelsIntensities", false)) {
					if (tempText=="") tempText+="axis and "+synapseMode+" axis channels (Ch."+parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))+"and Ch."+parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1))+")";
					else tempText+=" & axis and "+synapseMode+" axis channels (Ch."+parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))+"and Ch."+parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1))+")";
				}
				if (tempText=="") tempText="no";
				Table.set ("Value", row, tempText, table);
				row++;
			}
			Table.set("Parameter", row, "Pruning Method", table);
			Table.set("Value",row, call("ij.Prefs.get", "global.selectedPruningMethod",""), table);
			row++;
			if (call("ij.Prefs.get", "global.selectedPruningMethod","")!="None") {
				Table.set("Parameter", row, "Pruning Strength", table);
				Table.set("Value",row, parseInt(call("ij.Prefs.get", "global.pruningStrength",-1)), table);
				Table.set("Parameter", row+1, "Number of processing cycles", table);
				Table.set("Value",row+1, parseInt(call("ij.Prefs.get", "global.processingCycles",-1)), table);
				Table.set("Parameter", row+2, "Binary tool1", table);
				Table.set("Value",row+2, call("ij.Prefs.get", "global.binaryTool1",""), table);
				Table.set("Parameter", row+3, "Binary tool2", table);
				Table.set("Value",row+3, call("ij.Prefs.get", "global.binaryTool2",""), table);

				row=row+4;
			}			
		}	
 		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel"||call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"){
			Table.set("Parameter", row, "Foci detection method", table);
			Table.set("Value",row, call("ij.Prefs.get", "global.fociDetectionMode",""), table);
			row++;
 		}
		if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel"||call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize"){	
			Table.set("Parameter", row, "Foci Detection Threshold", table);
			Table.set("Value",row, call("ij.Prefs.get", "global.fociThreshold", -1), table);
			row++;
			if (call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel"){
				Table.set("Parameter", row, "Foci channel", table);
				Table.set("Value",row, parseInt(call("ij.Prefs.get", "global.fociChannel",-1)), table);
				Table.set("Parameter", row+1, "Foci Detection noise", table);
				Table.set("Value",row+1,parseInt(call("ij.Prefs.get", "global.noise", -1)), table);
				row=row+2;
				Table.set("Parameter",row, "Measure foci's ROI intensity", table);
				tempText="";
				if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) tempText+="Ch. "+parseInt(call("ij.Prefs.get", "global.measurementChannel",-1));
				if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) {
					if (tempText=="") tempText+="foci channel (Ch."+parseInt(call("ij.Prefs.get", "global.fociChannel",-1))+")";
					else tempText+=" & foci channel (Ch."+parseInt(call("ij.Prefs.get", "global.fociChannel",-1))+")";	
				}
				if (tempText=="") tempText="no";
				Table.set ("Value", row, tempText, table);
				row++;	
			}
			if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels"){
				if (call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize") {
					Table.set("Parameter", row, "Foci type", table);
					Table.set("Value",row, call("ij.Prefs.get", "global.fociType",""), table);
				}
				Table.set("Parameter", row+1, "Foci channel A", table);
				Table.set("Value",row+1, parseInt(call("ij.Prefs.get", "global.fociChannelA",-1)), table);
				Table.set("Parameter", row+2, "Foci Detection noise A", table);
				Table.set("Value",row+2,parseInt(call("ij.Prefs.get", "global.noiseA", -1)), table);
				Table.set("Parameter", row+3, "Foci channel B", table);
				Table.set("Value",row+3, parseInt(call("ij.Prefs.get", "global.fociChannelB",-1)), table);
				Table.set("Parameter", row+4, "Foci Detection noise B", table);
				Table.set("Value",row+4,parseInt(call("ij.Prefs.get", "global.noiseB", -1)), table);
				row=row+5;
				Table.set("Parameter", row, "Compute Colocalisation", table);
				if (call("ij.Prefs.get", "global.colocalisation",false)) { 
					Table.set("Value",row, "yes", table);
					Table.set("Parameter", row+1, "Max. distance for colocalisation", table);
					Table.set("Value",row+1, call("ij.Prefs.get", "global.colocalisationDistance",-1), table);
					Table.set("Parameter", row+2, "Generate random foci & colocalise", table);
					if (call("ij.Prefs.get", "global.randomisation",false)) {
						Table.set("Value",row+2, "yes", table);
						Table.set("Parameter", row+3, "Number of random data sets", table);
						Table.set("Value",row+3, parseInt(call("ij.Prefs.get", "global.randomCycles",-1)), table);
						Table.set("Parameter", row+4, "Show distribution of colocalised random foci and get p-value", table);
						if (call("ij.Prefs.get", "global.showPValue", false))Table.set("Value",row+4, "yes", table);
						else Table.set("Value",row+4, "no", table);
						row=row+5;
					}
					else {
						Table.set("Value",row+2, "no", table);
						row=row+3;
					}
				}	
				else {
					Table.set("Value",row, "no", table);
					row++;
				}	
				Table.set("Parameter",row, "Measure foci's ROI intensity", table);
				tempText="";
				if (parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1) tempText+="Ch. "+parseInt(call("ij.Prefs.get", "global.measurementChannel",-1));
				if (call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)) {
					if (tempText=="") tempText+="foci channels (Ch."+parseInt(call("ij.Prefs.get", "global.fociChannelA",-1))+" and Ch."+parseInt(call("ij.Prefs.get", "global.fociChannelB",-1))+")";
					else tempText+=" & foci channels (Ch."+parseInt(call("ij.Prefs.get", "global.fociChannelA",-1))+" and Ch."+parseInt(call("ij.Prefs.get", "global.fociChannelB",-1))+")";
				}
				if (tempText=="") tempText="no";
				Table.set ("Value", row, tempText, table);
				row++;	
			}
 		}
	}		
	Table.set("Parameter", row, "Images from", table);
	Table.set("Value",row,call("ij.Prefs.get", "global.processedFolder",""), table);
	row++;
	Table.set("Parameter", row, "ROI saved", table);
	if (call("ij.Prefs.get", "global.saveROIs", false)) {
		Table.set("Value",row,"yes", table);
		Table.set("Parameter", row+1, "ROI and any other output folder", table);
		Table.set("Value",row+1,call("ij.Prefs.get", "global.controlFolder",""), table);
		row+=2;
		}
	else {
		Table.set("Value",row,"no", table);
		row++;
	}
	Table.set("Parameter", row, "options:", table);
	Table.set("Value",row,"", table);
	Table.set("Parameter", row+1, "Show warning messages", table);
	if (call("ij.Prefs.get", "global.showWarningMessages", false)) Table.set("Value", row+1,"yes", table);
	else Table.set("Value", row+1,"no", table);
	Table.set("Parameter", row+2, "Show images", table);
	if (call("ij.Prefs.get", "global.debugMode", false)) Table.set("Value", row+2,"yes", table);
	else Table.set("Value", row+2,"no", table);
	Table.set("Parameter", row+3, "Get integrated density intensity values", table);
	if (call("ij.Prefs.get", "global.showIntDenValues", false)) Table.set("Value", row+3,"yes", table);
	else Table.set("Value", row+3,"no", table);
	Table.set("Parameter", row+4, "Get mean intensity values", table);
	if (call("ij.Prefs.get", "global.showMeanValues", false)) Table.set("Value", row+4,"yes", table);
	else Table.set("Value", row+4,"no", table);
	row+=5;
	if (call("ij.Prefs.get", "global.skeletonize",false)){
		Table.set("Parameter", row, "Get rough length values", table);
		if (call("ij.Prefs.get", "global.showRoughValues", false)) Table.set("Value", row,"yes", table);
		else Table.set("Value", row,"no", table);
		Table.set("Parameter", row+1, "Get fine length values", table);
		if (call("ij.Prefs.get", "global.showFineValues", false)) Table.set("Value", row+1,"yes", table);
		else Table.set("Value", row+1,"no", table);
		row+=2;
	}
	Table.set("Parameter", row, "Include reference Roi when measuring intensities", table);
	if (call("ij.Prefs.get", "global.showReferenceRoiValues", false)) Table.set("Value", row,"yes", table);
	else Table.set("Value", row,"no", table);
	row++;
	if ((call("ij.Prefs.get", "global.tool","")=="Count axis and off-axis foci in one channel"||call("ij.Prefs.get", "global.tool","")=="Count axis/off-axis foci in two channels and colocalize"||call("ij.Prefs.get", "global.tool","")=="Count foci in two channels and colocalize")&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1|| call("ij.Prefs.get", "global.measureFociChannelsIntensities", false))) {
		Table.set("Parameter", row, "Show foci's Maximum intensities", table);
		if (call("ij.Prefs.get", "global.showMaximumValues", false)) Table.set("Value", row,"yes", table);
		else Table.set("Value", row,"no", table);
		Table.set("Parameter", row+1, "Show foci's particle intensities", table);
		if (call("ij.Prefs.get", "global.showParticleValues", false)) Table.set("Value", row+1,"yes", table);
		else Table.set("Value", row+1,"no", table);
		row+=2;
	}
	Table.set("Parameter", row, "Meiosis bar tool", table);
	Table.set("Value",row,call("ij.Prefs.get", "global.tool",""), table);
	Table.set("Parameter", row+1, "Meiosis bar version", table);
	Table.set("Value",row+1,call("ij.Prefs.get", "global.version",""), table);
	Table.set("Parameter", row+2, "ImageJ version", table);
	Table.set("Value",row+2, IJ.getFullVersion(), table);
	row+=2;
	
	for (i = 0; i < row+1; i++) Table.set("", i, "", table);
	
	if (row>(lastRow-1)) {
		text=Table.headings(table);
		while (lastIndexOf(text, "\t")!=-1) {
			col=substring(text, lastIndexOf(text, "\t")+1);
			if (col!="Parameter" && col!="Value"){
				for (i = lastRow; i < row+1; i++) Table.set(col, i, "", table);
			}
			text=substring(text,0, (lastIndexOf(text, "\t")));
		}
		if (text!="Parameter" && text!="Value"){
				for (i = lastRow; i < row+1; i++) Table.set(text, i, "", table);
			}
	}
	
	if (row<(lastRow-1)) {
		for (j = row+1; j < lastRow; j++) {
			Table.set("Parameter", j, "", table);
			Table.set("Value", j, "", table);
			Table.set("",j,"", table);
		}
	}		
}

function findResultSetFiles(stageArray, inputFolder,tool, imagesList,start){
	if (inputFolder=="0") {return(-1);}
	else{
		if (start<imagesList.length+1){
			for (i = start; i < imagesList.length; i++){
				if(File.isDirectory(inputFolder+File.separator+imagesList[i])==false){
					for (j = 0; j < stageArray.length; j++){
						if(startsWith(imagesList[i], stages[j])&& endsWith(imagesList[i], ".tif")){
							tempPath=call("ij.Prefs.get", "global.controlFolder","")+tool+"_RoiSet_"+replace(imagesList[i],".tif", ".zip");
							if (File.exists(tempPath)) return(i);
						}
					}
				}
			}
		}
		return(-1);
	}
}
</codeLibrary> 
/////////////////////////////////
<line>
<button>
label=Get stage sorted images 
bgcolor=#b0e0e6
icon=noicon
arg=<macro>
run("Close All"); 
if (isOpen("")){
	showMessage("Warning", "Close the previous preprocess bar first (no title window)");
	return;
}
run("Clear Results");
roiManager("reset");
displayMode=newArray("composite","grayscale nucleus", "grayscale axis");
Dialog.create("File parameters");
Dialog.addString("Analyse only files with extension:", call("ij.Prefs.get", "global.extension",""));
Dialog.addChoice("Display mode", displayMode, call("ij.Prefs.get", "global.display","composite"));
Dialog.addChoice("Drawing mode", newArray("freehand","magicwand"), call("ij.Prefs.get", "global.drawingMode",""));
Dialog.addNumber("Nucleus channel:", call("ij.Prefs.get", "global.nucleusChannel",-1));
Dialog.addToSameRow();
Dialog.addNumber("Axis channel:", call("ij.Prefs.get", "global.wholeAxisChannel",-1));
Dialog.addNumber("Number of different stages/types (max "+call("ij.Prefs.get", "global.maxStagesNumber",-1)+"):", call("ij.Prefs.get", "global.stagesNumber",-1));
Dialog.addDirectory("Raw images directory", call("ij.Prefs.get", "global.inputFolder",""));
Dialog.show();

call("ij.Prefs.set", "global.extension",toLowerCase(Dialog.getString()));
call("ij.Prefs.set", "global.display",Dialog.getChoice());
call("ij.Prefs.set", "global.drawingMode",Dialog.getChoice());
if (call("ij.Prefs.get", "global.drawingMode","")=="freehand") setTool("freehand");
else {
	setTool("wand");
	run("Wand Tool...", "tolerance="+parseInt(call("ij.Prefs.get", "global.magicWandTolerance",-1))+" mode="+call("ij.Prefs.set", "global.magicWandMode","")+"");
}
call("ij.Prefs.set", "global.nucleusChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.wholeAxisChannel",Dialog.getNumber());
stagesNumber=Dialog.getNumber();
if (stagesNumber<call("ij.Prefs.get", "global.maxStagesNumber", -1)) call("ij.Prefs.set", "global.stagesNumber",stagesNumber);
else call("ij.Prefs.set", "global.stagesNumber",call("ij.Prefs.get", "global.maxStagesNumber", -1));
call("ij.Prefs.set", "global.inputFolder",Dialog.getString());
if (call("ij.Prefs.get", "global.inputFolder","")=="") {
	showMessageWithCancel("warning","No input data folder was set");
	return;
}
if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
processedFolder=call("ij.Prefs.get", "global.inputFolder","")+"processedData";if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
call("ij.Prefs.set", "global.processedFolder",processedFolder);
images = getFileList(call("ij.Prefs.get", "global.inputFolder",""));
counter=findFiles(call("ij.Prefs.get", "global.inputFolder",""),call("ij.Prefs.get", "global.singleChannel",false),call("ij.Prefs.get", "global.singleChannelTag",""),call("ij.Prefs.get", "global.extension",""),images,0);		

if (counter>-1)
	{
	call("ij.Prefs.set", "global.lastImageFileProcessed",counter);
	path=call("ij.Prefs.get", "global.inputFolder","")+images[counter];
	openMultipleChannelsImage(path);	
	getDimensions(width, height, channels, slices, frames);
	call("ij.Prefs.set", "global.channelsNumber",channels);
	}
else {
	showMessage("There are no files to open");
	return;
}
		
Dialog.create("Stages/types parameters");
for(i=0; i<call("ij.Prefs.get", "global.stagesNumber", -1); i++) {
	tempText="global.stage"+i;
	Dialog.addString("Type "+i+":", call("ij.Prefs.get", tempText, ""));
}
Dialog.show();
for(i=0; i<call("ij.Prefs.get", "global.stagesNumber", -1); i++) {
	tempText="global.stage"+i;
	call("ij.Prefs.set", tempText, toLowerCase(Dialog.getString()));
}
bar_name="";	
if(isOpen(bar_name)) {
	run("Close AB", bar_name);
}
bar = "<fromString>\n";
functionFindFiles="\nfunction findFiles(inputFolder,singleChannelFile,singleChannelTags,extension,imagesList,start) {\n	if (inputFolder==\"0\") return(-1);";
functionFindFiles+="\n	else{\n		if (start<imagesList.length+1){\n			if(singleChannelFile){\n				singleFileFound=newArray(call(\"ij.Prefs.get\", \"global.channelsNumber\",-1));";
functionFindFiles+="\n				for(i=0; i<singleFileFound.length; i++) singleFileFound[i]=false;\n				for (i = start; i < imagesList.length; i++){\n					if(File.isDirectory(inputFolder+File.separator+imagesList[i])==false){";
functionFindFiles+="\n						if (endsWith(toLowerCase(imagesList[i]), extension) && indexOf(toLowerCase(imagesList[i]),singleChannelTag)>-1) return(i);\n					}\n				}";
functionFindFiles+="\n				return(-1);\n			}\n			else{\n				for (i = start; i < imagesList.length; i++){\n					if(File.isDirectory(inputFolder+File.separator+imagesList[i])==false){";
functionFindFiles+="\n						if (endsWith(toLowerCase(imagesList[i]), extension)) return(i);\n					}\n				}\n				return(-1);";
functionFindFiles+="\n			}\n		}\n		else return(-1);\n	}\n}\n";

functionOpenMultipleChannelsImage="\nfunction openMultipleChannelsImage(string){\n	run(\"Bio-Formats Importer\", \"open=\"+string+\" autoscale color_mode=Composite view=Hyperstack stack_order=XYCZT\");";
functionOpenMultipleChannelsImage+="\n	if (call(\"ij.Prefs.get\", \"global.display\",\"composite\")==\"composite\") Stack.setDisplayMode(\"composite\");\n	else {\n		if (call(\"ij.Prefs.get\", \"global.display\",\"composite\")==\"grayscale nucleus\")";
functionOpenMultipleChannelsImage+="\n			{\n			Stack.setDisplayMode(\"grayscale\");\n			if (call(\"ij.Prefs.get\", \"global.nucleusChannel\",-1)>0)	Stack.setChannel(call(\"ij.Prefs.get\", \"global.nucleusChannel\",-1));";
functionOpenMultipleChannelsImage+="\n			}\n			else {\n				Stack.setDisplayMode(\"grayscale\");\n				if (call(\"ij.Prefs.get\", \"global.wholeAxisChannel\",-1)>0) Stack.setChannel(call(\"ij.Prefs.get\", \"global.wholeAxisChannel\",-1));";
functionOpenMultipleChannelsImage+="\n			}\n		}\n}\n";


bar = bar+newLine();
next="<button>\nlabel=Next File to crop\nbgcolor=#b0e0e6\nicon=noicon\narg=<macro>\nclose(\"*\");\n roiManager(\"reset\");";
next+="\ncounter=parseInt(call(\"ij.Prefs.get\", \"global.lastImageFileProcessed\",-1));\nimages = getFileList(call(\"ij.Prefs.get\", \"global.inputFolder\",\"\"));";
next+="\nif (call(\"ij.Prefs.get\", \"global.inputFolder\",\"\")==\"\") showMessage(\"click on start button first\");\n else{\ncounter++;";
next+="\ncounter=findFiles(call(\"ij.Prefs.get\", \"global.inputFolder\",\"\"),call(\"ij.Prefs.get\", \"global.singleChannel\",false),call(\"ij.Prefs.get\", \"global.singleChannelTag\",\"\"),call(\"ij.Prefs.get\", \"global.extension\",\"\"),images,counter);";
next+="\nif (counter>-1){\n	call(\"ij.Prefs.set\", \"global.lastImageFileProcessed\",counter);\n	path=call(\"ij.Prefs.get\", \"global.inputFolder\",\"\")+images[counter];\n	openMultipleChannelsImage(path);";
next+="\n}\nelse {showMessage(\"There are no more else files to open\");}\n}\n";
next=next+functionOpenMultipleChannelsImage;
next=next+functionFindFiles;
next+="\n</macro>";
bar=bar+next+endLine();
functionCropStage="\nfunction cropStage(stage) {\n	inputFolder=call(\"ij.Prefs.get\", \"global.inputFolder\",\"\");\n	if (inputFolder==\"\") {showMessage(\"click on Preprocess images first\");}";
functionCropStage+="\n	else {\n		processedFolder=inputFolder+File.separator+\"processedData\";\n		call(\"ij.Prefs.set\", \"global.processedFolder\",processedFolder);";
functionCropStage+="\nif (File.isDirectory(processedFolder)==false) File.makeDirectory(processedFolder);\n		title=getTitle();\n		Stack.getDimensions(width, height, channels, slices, frames);\n		nRois=roiManager(\"count\");";
functionCropStage+="\n		if(nRois>0){\n			for (i=0; i<nRois; i++){\n				selectWindow(title);\n				roiManager(\"Select\", i);\n				run(\"Duplicate...\", \"duplicate\");";
functionCropStage+="\n				rename(\"duplicate\");\n				roiManager(\"add\");				roiManager(\"select\", roiManager(\"count\")-1);\n				RoiManager.setGroup(1);\n				roiManager(\"rename\", \"user-defined\");";
functionCropStage+="\n				roiName=processedFolder+File.separator+\"user-defined_\"+stage+\"_\"+substring(title,0,indexOf(title,\".\"))+\"_\"+i+\".roi\";\n				roiManager(\"save selected\", roiName);";
functionCropStage+="\n				if(notFullFrameRoi(i, width, height)) {\n					selectWindow(\"duplicate\");\n					roiManager(\"select\", roiManager(\"count\")-1);\n					run(\"Make Inverse\");";
functionCropStage+="\n					setBackgroundColor(0, 0, 0);\n					for(j=1; j<channels+1; j++){\n						Stack.setChannel(j);\n						run(\"Clear\", \"slice\");";
functionCropStage+="\n					}\n					run(\"Select None\");\n				}\n				if (channels>1) Stack.setDisplayMode(\"composite\");\n				name=processedFolder+File.separator+stage+\"_\"+substring(title,0,indexOf(title,\".\"))+\"_\"+i;";
functionCropStage+="\n				saveAs(\"Tiff\", name);\n				close();\n			}\n		roiManager(\"reset\");\n		}\n	else showMessage(\"There is no ROI in the ROI manager\");";
functionCropStage+="\n	}\n}\nfor (i=0;i<call(\"ij.Prefs.get\", \"global.stagesNumber\", -1);i++) {\n";

functionGetStage="\nfunction getStage(number) {\n	tempText=\"global.stage\"+number;\n	output=call(\"ij.Prefs.get\", tempText, \"\");\n	return output;\n}\n";

functionNotFullFrameRoi="\nfunction notFullFrameRoi(roiIndex, imageWidth, imageHeight){\n	output=true;\n	roiManager(\"select\", i);\n	Roi.getBounds(x,y,w,h);";
functionNotFullFrameRoi+="\n	if(Roi.getType==\"rectangle\" && x==0 && y==0 && w==imageWidth && h==imageHeight) output=false;\n	return(output);\n}\n";

for(i=0; i<call("ij.Prefs.get", "global.stagesNumber", -1); i++) {
	bar=bar+newLine();
 	tempText="global.stage"+i;
  	bar = bar+newButton(call("ij.Prefs.get", tempText, ""),i, functionNotFullFrameRoi, functionGetStage, functionCropStage);
 	 bar = bar+endLine();
}

run("Action Bar", bar);

function newLine(){
  return "\n<line>\n";
}
function endLine(){
  return "\n</line>\n";
}
function newButton(label, n, function1, function2, function3){
  b = "<button>\nlabel="+label+"\nbgcolor=#f0f8ff\narg=<macro>\n";
  b+="\ncropStage(getStage("+n+"));\n";
  b+=function1;
  b+=function2;
  b+=function3;
  b+="\n</macro>\n";
  return b;
}
</macro>
</line>
/////////////////////////////

<line>
<button>
label=Measure Global intensities
bgcolor=#66cdaa
icon=noicon
arg=<macro>

call("ij.Prefs.set", "global.lastImageFileProcessed",0);
call("ij.Prefs.set", "global.tool","Measure Global intensities");
run("Set Measurements...", "mean integrated redirect=None decimal=3");
if (isOpen("intensities.xls")) {
	selectWindow("intensities.xls");
	close("intensities.xls");
}
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(true);
run("Close All"); 
run("Clear Results");
originalProcessedFolder=call("ij.Prefs.get", "global.processedFolder","");
ROIModes=newArray("user-defined ROI", "nucleus threshold");
Dialog.create("Measurements parameters");
Dialog.addChoice("Measurement mode", ROIModes, call("ij.Prefs.get", "global.ROImode",""));
Dialog.addMessage("If nucleus threshold mode selected");
Dialog.addNumber("   Nucleus channel:", call("ij.Prefs.get", "global.nucleusChannel",-1));
Dialog.addChoice("   Threshold type for nucleus detection", newArray("Triangle","Huang", "Moments"), call("ij.Prefs.get", "global.nucleusThreshold",""));
Dialog.addCheckbox("Save ROIs", call("ij.Prefs.get", "global.saveROIs", false));
Dialog.addDirectory("Cropped images directory", call("ij.Prefs.get", "global.processedFolder",""));
if (call("ij.Prefs.get", "global.channelsNumber",-1)>-1)
	{
	Dialog.addMessage("Measure");
	for(i=1; i<	call("ij.Prefs.get", "global.channelsNumber",-1)+1; i++) {
		tempText="global.measureChannel"+i;
		Dialog.addCheckbox("Channel "+i, call("ij.Prefs.get", tempText, true));
	}
}			
Dialog.show();
call("ij.Prefs.set", "global.ROImode", Dialog.getChoice());
call("ij.Prefs.set", "global.nucleusChannel", Dialog.getNumber());	
call("ij.Prefs.set", "global.nucleusThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.saveROIs", Dialog.getCheckbox());
call("ij.Prefs.set", "global.processedFolder", Dialog.getString());
if (call("ij.Prefs.get", "global.processedFolder","")=="") {
	showMessageWithCancel("warning","No input data folder was set");
	return;
}
if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
call("ij.Prefs.set", "global.inputFolder",File.getParent(call("ij.Prefs.get", "global.processedFolder","")));
if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
call("ij.Prefs.set", "global.controlFolder", call("ij.Prefs.get", "global.inputFolder","")+"controlData"+File.separator());
if (File.isDirectory(call("ij.Prefs.get", "global.controlFolder",""))==false) File.makeDirectory(call("ij.Prefs.get", "global.controlFolder",""));
if (call("ij.Prefs.get", "global.channelsNumber",-1)>-1)
	{
	for(i=1; i<	call("ij.Prefs.get", "global.channelsNumber",-1)+1; i++) {
		tempText="global.measureChannel"+i;
		call("ij.Prefs.set", tempText,Dialog.getCheckbox()); 
	}
}

images=getFileList(call("ij.Prefs.get", "global.processedFolder",""));
stages=newArray(parseInt(call("ij.Prefs.get","global.stagesNumber", -1)));
for (i=0; i<stages.length; i++) {
	tempText="global.stage"+i;
	stages[i]=call("ij.Prefs.get", tempText,"");
}
maxChannel=getMaxChannel();
analysedImages=0;
Table.create("imageAnalysis");
Table.showRowIndexes(false);
do	{
	counter=findStageFiles(stages, call("ij.Prefs.get", "global.processedFolder",""),images,counter); 
	if (counter>-1){
		call("ij.Prefs.set", "global.channelErrorMessageShown", false);
		showProgress(counter, images.length);
		message="image "+d2s(counter, 0)+" of "+d2s(images.length, 0);
		showStatus(message);		
		roiManager("reset");
		
		path=call("ij.Prefs.get", "global.processedFolder","")+images[counter];
		roiPath=call("ij.Prefs.get", "global.processedFolder", "")+"user-defined_"+replace(images[counter],".tif", ".roi");
		counter++;
		open(path);
		name=getTitle();
		getDimensions(width, height, channels, slices, frames);
		if (call("ij.Prefs.get", "global.channelsNumber",-1)==-1) {
			call("ij.Prefs.set", "global.channelsNumber",channels);
			getChannels();
			initializeSimpleIntensityTable("imageAnalysis");
		}
		Table.set("Type", analysedImages, substring(name,0,indexOf(name,"_")), "imageAnalysis");
		Table.set("Image name",analysedImages, substring(name,0,indexOf(name,".")), "imageAnalysis");
		Table.set("Comment", analysedImages, "", "imageAnalysis");
		Table.update("imageAnalysis");
		checkChannels(channels, maxChannel, "imageAnalysis", analysedImages, substring(name,0,indexOf(name,".")));
		if (call("ij.Prefs.get", "global.channelTestPassed", false)) {	
			getReferenceRoi(name, roiPath, analysedImages, "imageAnalysis");
			if (parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1))>-1) {
				for (i=1; i<call("ij.Prefs.get", "global.channelsNumber",-1)+1; i++){
					tempText="global.measureChannel"+i;	
					if (call("ij.Prefs.get", tempText,true)) measure(i, "imageAnalysis", analysedImages, 1, 0,call("ij.Prefs.get", "global.ROImode","") , name);
					}
				if (call("ij.Prefs.get", "global.saveROIs", false)) saveRois(name);
			}
		}		
		close(name);
		analysedImages++;		
	}
}
while (counter>-1);
if (analysedImages==0) {showMessage("There are no meiosis stage image to analyse!");}	
else 
	{
	burnParameters("imageAnalysis", analysedImages);
	selectWindow("imageAnalysis");
	resultName=call("ij.Prefs.get", "global.processedFolder", "")+"intensities.xls";
	saveAs("Results", resultName);
	}
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(false);


//////

function getChannels(){
	Dialog.create("Set Channels Measurements");
	Dialog.addMessage("Channels to measure");
	for(i=1; i<	call("ij.Prefs.get", "global.channelsNumber",-1)+1; i++) {
		tempText="global.measureChannel"+i;
		Dialog.addCheckbox("Channel "+i, call("ij.Prefs.get", tempText, true));
	}
	Dialog.show();
	for(i=1; i<	call("ij.Prefs.get", "global.channelsNumber",-1)+1; i++) {
		tempText="global.measureChannel"+i;
		call("ij.Prefs.set", tempText,Dialog.getCheckbox()); 
	}
}

function initializeSimpleIntensityTable(table){
	Table.set("Type", 0, "", table);
	Table.set("Image name", 0, "", table);
	for(i=1; i<	call("ij.Prefs.get", "global.channelsNumber",-1)+1; i++) {
		tempText="global.measureChannel"+i;
		if (call("ij.Prefs.get", tempText, true)) {
			if (i==call("ij.Prefs.get", "global.nucleusChannel",-1)) channelParam="nucleus ch.";
			else channelParam="Ch."+i;
			if (call("ij.Prefs.get", "global.ROImode","")=="nucleus threshold") roiParam="(nucleus)";
			else roiParam="("+call("ij.Prefs.get", "global.ROImode","")+")";
			if (call("ij.Prefs.get", "global.showIntDenValues", false)) {
				param=channelParam+" intDen "+roiParam;
				Table.set(param, 0, "", table);
			}
			if (call("ij.Prefs.get", "global.showMeanValues", false)) {
				param=channelParam+" mean "+roiParam;
				Table.set(param, 0, "", table);
			}	
		}
	}
	Table.set("Comment",0,"", table);
	Table.set("", 0, "", table);
	Table.set("Parameter", 0, "", table);
	Table.set("Value",0,"", table);
}
</macro>
</line>

/////////////////////////////////////////////////////////////////////////////////////////////
<line>
<button>
label=Count foci in two channels and colocalize
bgcolor=#66cdaa
icon=noicon
arg=<macro>
call("ij.Prefs.set", "global.lastImageFileProcessed",0);
call("ij.Prefs.set", "global.tool","Count foci in two channels and colocalize");
call("ij.Prefs.set", "global.toolUsesBothAxisAndOffAxis",false);
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(true);
if (isOpen("2Foci.xls")) {
	selectWindow("2Foci.xls");
	close("2Foci.xls");
}
if (isOpen("individual2Foci.xls")) {
	selectWindow("individual2Foci.xls");
	close("individual2Foci.xls");
}
run("Close All"); 
run("Clear Results");
ROIModes=newArray("user-defined ROI", "nucleus threshold");

Dialog.create("Measurements parameters");
Dialog.addCheckbox("Smooth original images", call("ij.Prefs.get", "global.smooth",false));
Dialog.addChoice("Measurement mode", ROIModes, call("ij.Prefs.get", "global.ROImode",""));
Dialog.addMessage("If nucleus threshold mode selected");
Dialog.addNumber("   Nucleus channel:", call("ij.Prefs.get", "global.nucleusChannel",-1));
Dialog.addChoice("   Threshold type for nucleus detection", newArray("Triangle","Huang", "Moments"), call("ij.Prefs.get", "global.nucleusThreshold",""));
Dialog.addMessage("   Foci Detection Parameters");
Dialog.addChoice("   foci detection threshold", newArray("None", "Huang", "IJ_IsoData"),call("ij.Prefs.get", "global.fociThreshold",""));
Dialog.addNumber("   Foci A channel:", call("ij.Prefs.get", "global.fociChannelA",-1));
Dialog.addToSameRow();
Dialog.addNumber("   Noise tolerance for foci A detection:", call("ij.Prefs.get", "global.noiseA", -1));
Dialog.addNumber("   Foci B channel:", call("ij.Prefs.get", "global.fociChannelB",-1));
Dialog.addToSameRow();
Dialog.addNumber("   Noise tolerance for foci B detection:", call("ij.Prefs.get", "global.noiseB", -1));
Dialog.addCheckbox("Compute colocalisation", call("ij.Prefs.get", "global.colocalisation",false));
Dialog.addToSameRow();
Dialog.addNumber("    Maximal distance in um to consider as colocalized:", call("ij.Prefs.get", "global.colocalisationDistance",-1));
Dialog.addCheckbox("Get estimation of colocalisation with random images", call("ij.Prefs.get", "global.randomisation", false));
Dialog.addToSameRow();
Dialog.addNumber("    Number of randomisation cycles", call("ij.Prefs.get", "global.randomCycles",-1));
Dialog.addCheckbox("Show random distribution vs real value", call("ij.Prefs.get", "global.showPValue", false));
Dialog.addNumber("Measure foci ROIs' channel",call("ij.Prefs.get", "global.measurementChannel",-1), 0, 1, " intensity (use -1 if none to be added)");
Dialog.addToSameRow();
Dialog.addCheckbox(" add foci channels intensities", call("ij.Prefs.get", "global.measureFociChannelsIntensities",false));
Dialog.addCheckbox("Save ROIs", call("ij.Prefs.get", "global.saveROIs", false));
Dialog.addDirectory("Cropped images directory", call("ij.Prefs.get", "global.processedFolder",""));	
Dialog.show();
call("ij.Prefs.set", "global.smooth",Dialog.getCheckbox());
call("ij.Prefs.set", "global.ROImode",Dialog.getChoice());
call("ij.Prefs.set", "global.nucleusChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.nucleusThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.validPruningMethods",1);
call("ij.Prefs.set", "global.fociType","total");
call("ij.Prefs.set", "global.fociDetectionMode","within ROI");
call("ij.Prefs.set", "global.fociThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.fociChannelA",Dialog.getNumber());
call("ij.Prefs.set", "global.noiseA", Dialog.getNumber());
call("ij.Prefs.set", "global.fociChannelB",Dialog.getNumber());
call("ij.Prefs.set", "global.noiseB", Dialog.getNumber());
call("ij.Prefs.set", "global.colocalisation",Dialog.getCheckbox());
call("ij.Prefs.set", "global.colocalisationDistance",Dialog.getNumber());
call("ij.Prefs.set", "global.randomisation", Dialog.getCheckbox());
call("ij.Prefs.set", "global.randomCycles",Dialog.getNumber());
call("ij.Prefs.set", "global.showPValue", Dialog.getCheckbox());
call("ij.Prefs.set", "global.showAxesValues", false);
call("ij.Prefs.set", "global.showFociValues",true);
call("ij.Prefs.set", "global.measurementChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.measureAxesChannelsIntensities",false);
call("ij.Prefs.set", "global.measureFociChannelsIntensities", Dialog.getCheckbox());
call("ij.Prefs.set", "global.saveROIs", Dialog.getCheckbox());
call("ij.Prefs.set", "global.processedFolder",Dialog.getString());
if (call("ij.Prefs.get", "global.processedFolder","")=="") {
	showMessageWithCancel("warning","No input data folder was set");
	return;
}
if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
call("ij.Prefs.set", "global.inputFolder",File.getParent(call("ij.Prefs.get", "global.processedFolder","")));
if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
call("ij.Prefs.set", "global.controlFolder", call("ij.Prefs.get", "global.inputFolder","")+"controlData"+File.separator());
if (File.isDirectory(call("ij.Prefs.get", "global.controlFolder",""))==false) File.makeDirectory(call("ij.Prefs.get", "global.controlFolder",""));
if (parseInt(call("ij.Prefs.get", "global.fociChannelA",-1))==parseInt(call("ij.Prefs.get", "global.fociChannelB",-1))) {
	showMessageWithCancel("warning","foci A and B channels are identical");
	return;
}

images=getFileList(call("ij.Prefs.get", "global.processedFolder",""));
stages=newArray(parseInt(call("ij.Prefs.get","global.stagesNumber", -1)));
for (i=0; i<stages.length; i++) {
	tempText="global.stage"+i;
	stages[i]=call("ij.Prefs.get", tempText,"");
}
maxChannel=getMaxChannel();
analysedImages=0;
Table.create("imageAnalysis");
Table.showRowIndexes(false);
initializeImageTable("imageAnalysis");
analysedParticles=0;
if (call("ij.Prefs.get", "global.showFociValues",false)&&call("ij.Prefs.get", "global.showIndividualFoci", false)&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false))) {
	Table.create("particleAnalysis");
	Table.showRowIndexes(false);
	initializeParticleTable("particleAnalysis");
}
do	{
	counter=findStageFiles(stages, call("ij.Prefs.get", "global.processedFolder",""),images,counter); 
	if (counter>-1) {
		call("ij.Prefs.set", "global.channelErrorMessageShown", false);
		call("ij.Prefs.set", "global.pValueErrorMessageShown", false);
		showProgress(counter, images.length);
		message="image "+d2s(counter, 0)+" of "+d2s(images.length, 0);
		showStatus(message);		
		roiManager("reset");
		path=call("ij.Prefs.get", "global.processedFolder","")+images[counter];
		roiPath=call("ij.Prefs.get", "global.processedFolder","")+"user-defined_"+replace(images[counter],".tif", ".roi");
		counter++;
		open(path);
		name=getTitle();
		getPixelSize(unit, pixelWidth, pixelHeight);
		if (pixelWidth!=pixelHeight && call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the macro will assume pixels are square, using the pixelWidth as pixelHeight");
		Stack.getDimensions(width, height, channels, slices, frames);
		call("ij.Prefs.set", "global.channelsNumber",channels);
		if ((slices>1||frames>1)&& call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the image contains more slices/frames than expected");
		if (call("ij.Prefs.get", "global.smooth",false)) {
		 	for (i=0; i<channels+1; i++) {
		 		Stack.setChannel(i);
		 		run("Smooth");
		 	}
		}
		Table.set("Type", analysedImages, substring(name,0,indexOf(name,"_")), "imageAnalysis");
		Table.set("Image name",analysedImages, substring(name,0,indexOf(name,".")), "imageAnalysis");
		Table.set("Comment", analysedImages,"", "imageAnalysis");
		Table.update("imageAnalysis");
		checkChannels(channels, maxChannel, "imageAnalysis", analysedImages, substring(name,0,indexOf(name,".")));
		if (call("ij.Prefs.get", "global.channelTestPassed", false)) {
			getReferenceRoi(name, roiPath, analysedImages, "imageAnalysis");
			run("Select None");
			if (parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1))>-1){
				if (call("ij.Prefs.get", "global.showReferenceRoiValues",false)) measureReferenceIntensities("imageAnalysis", analysedImages, name);	
				call("ij.Prefs.set", "global.totalFociARoiIndex",-1);
				countFoci("A", "imageAnalysis", analysedImages, "total", call("ij.Prefs.get", "global.noiseA", -1), call("ij.Prefs.get", "global.fociChannelA",-1), name);
				tempTextA="global.totalFociARoiIndex";
				call("ij.Prefs.set", "global.totalFociBRoiIndex",-1);
				countFoci("B", "imageAnalysis", analysedImages, "total", call("ij.Prefs.get", "global.noiseB", -1), call("ij.Prefs.get", "global.fociChannelB",-1), name);
				tempTextB="global.totalFociBRoiIndex";
   				if (call("ij.Prefs.get", "global.colocalisation", false)&& parseInt(call("ij.Prefs.get", tempTextA, -1))>-1 && parseInt(call("ij.Prefs.get", tempTextB, -1))>-1) {
					nColocFociA=findColoc("total", "A", "B", "imageAnalysis",analysedImages);
   					nColocFociB=findColoc("total", "B", "A", "imageAnalysis",analysedImages);
					if (call("ij.Prefs.get", "global.randomisation", false)) {
						generateRandomColocValue("total","A", "B", "imageAnalysis",analysedImages, nColocFociA, name);
						generateRandomColocValue("total","B", "A","imageAnalysis",analysedImages, nColocFociB, name);
   					}
				}
				else {
					if (call("ij.Prefs.get", "global.colocalisation", false)){
						tempText="colocalised foci";
						Table.set(tempText+"A", analysedImages, "", "imageAnalysis");
						Table.set(tempText+"B", analysedImages, "", "imageAnalysis");
						if (call("ij.Prefs.get", "global.randomisation", false)) {
							tempText="Mean randomly colocalised foci";
							Table.set(tempText+"A", analysedImages, "", "imageAnalysis");
							Table.set(tempText+"B", analysedImages, "", "imageAnalysis");		
						}
					}	
				}
				if((call("ij.Prefs.get", "global.showFociValues",false)&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)))) {
					if (call("ij.Prefs.get", "global.showParticleValues",false)){
						if (call("ij.Prefs.get", "global.showIndividualFoci", false)) analysedParticles=analyseParticles(name, "imageAnalysis", analysedImages, "particleAnalysis", analysedParticles);
   						else analysedParticles=analyseParticles(name, "imageAnalysis", analysedImages, "", analysedParticles);
					}
					if (call("ij.Prefs.get", "global.showMaximumValues",false)) analyseMaxima(name, "imageAnalysis", analysedImages);
				}
				purgeRois();
				if (call("ij.Prefs.get", "global.saveROIs", false)) saveRois(name);
				close(name);
				analysedImages++;		
			}
		}	
	}
}	
while (counter>-1)

if (analysedImages==0) {showMessage("There are no meiosis stage image to analyse!");}	
else 
	{
	if (call("ij.Prefs.get", "global.showFociValues",false)&&call("ij.Prefs.get", "global.showIndividualFoci", false)&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false))) {
		selectWindow("particleAnalysis");
		resultName=call("ij.Prefs.get", "global.processedFolder","")+"individual2Foci.xls";
		saveAs("Results", resultName);
	}
	burnParameters("imageAnalysis", analysedImages);
	selectWindow("imageAnalysis");
	resultName=call("ij.Prefs.get", "global.processedFolder","")+"2Foci.xls";
	saveAs("Results", resultName);
	}
	
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(false);
////
</macro>
</line>

///////////////////////////////////////////////////////////////////////////////////////////////

<line>
<button>
label=Measure axis length
bgcolor=#cbbeb5
icon=noicon
arg=<macro>
call("ij.Prefs.set", "global.tool","Measure axis length");
call("ij.Prefs.set", "global.usesMultiplePruningMethods",false);
call("ij.Prefs.set", "global.lastImageFileProcessed",0);
roiManager("Show None");
if (isOpen("lengths.xls")) {
	selectWindow("lengths.xls");
	close("lengths.xls");
}
run("Set Measurements...", "area redirect=None decimal=3");
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(true);
run("Close All"); 
run("Clear Results");
nucleusThresholds=newArray(parseInt(call("ij.Prefs.get", "global.nucleusThresholdsNumber",-1)));
for(i=0; i<	nucleusThresholds.length; i++) {
	tempText="global.nucleusThreshold"+i;
	nucleusThresholds[i]=call("ij.Prefs.get", tempText, "");
}
axisThresholds=newArray(parseInt(call("ij.Prefs.get", "global.axisThresholdsNumber",-1)));
for(i=0; i<	axisThresholds.length; i++) {
	tempText="global.axisThreshold"+i;
	axisThresholds[i]=call("ij.Prefs.get", tempText, "");
}
ROIModes=newArray("user-defined ROI", "nucleus threshold");

Dialog.create("Measurements parameters");
Dialog.addCheckbox("Use advanced user mode", call("ij.Prefs.get", "global.advancedUserMode",false));
Dialog.addChoice("Measurement mode", ROIModes, call("ij.Prefs.get", "global.ROImode",""));
Dialog.addMessage("If nucleus threshold mode selected");
Dialog.addNumber("   Nucleus channel:", call("ij.Prefs.get", "global.nucleusChannel",-1));
Dialog.addChoice("   Threshold type for nucleus detection", nucleusThresholds, call("ij.Prefs.get", "global.nucleusThreshold",""));
Dialog.addMessage("Axis Detection Parameters");	
Dialog.addNumber("   Axis channel:", call("ij.Prefs.get", "global.wholeAxisChannel",-1));
Dialog.addChoice("   Threshold type for axis detection", axisThresholds, call("ij.Prefs.get", "global.axisThreshold",""));
Dialog.addNumber("   Minimal axis size in pixels:", call("ij.Prefs.get", "global.smallestSize", -1));	
Dialog.addMessage("Intensity measurements");	
Dialog.addNumber("Measure axis ROI's channel",call("ij.Prefs.get", "global.measurementChannel",-1), 0, 1, " intensity (use -1 if none to be added)");
Dialog.addToSameRow();
Dialog.addCheckbox(" add axis channels intensity", call("ij.Prefs.get", "global.measureAxesChannelsIntensities",false));
Dialog.addMessage("");
Dialog.addCheckbox("Save ROIs", call("ij.Prefs.get", "global.saveROIs", false));
Dialog.addDirectory("Cropped images directory", call("ij.Prefs.get", "global.processedFolder",""));
Dialog.show();

call("ij.Prefs.set", "global.advancedUserMode",Dialog.getCheckbox());
call("ij.Prefs.set", "global.ROImode", Dialog.getChoice());
call("ij.Prefs.set", "global.nucleusChannel", Dialog.getNumber());	
call("ij.Prefs.set", "global.nucleusThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.wholeAxisChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.axisThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.smallestSize", Dialog.getNumber());
call("ij.Prefs.set", "global.usesMultiplePruningMethods",false);
call("ij.Prefs.set", "global.validPruningMethods",1);
call("ij.Prefs.set", "global.skeletonize",true);
call("ij.Prefs.set", "global.showAxesValues", true);
call("ij.Prefs.set", "global.showFociValues",false);
call("ij.Prefs.set", "global.colocalisation", false);
call("ij.Prefs.set", "global.measurementChannel",Dialog.getNumber());
call("ij.Prefs.set","global.measureAxesChannelsIntensities",Dialog.getCheckbox());
call("ij.Prefs.set", "global.measureFociChannelsIntensities", false);
call("ij.Prefs.set", "global.saveROIs", Dialog.getCheckbox());
call("ij.Prefs.set", "global.processedFolder",Dialog.getString());
if (call("ij.Prefs.get", "global.processedFolder","")=="") {
	showMessageWithCancel("warning","No input data folder was set");
	return;
}
if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
call("ij.Prefs.set", "global.inputFolder",File.getParent(call("ij.Prefs.get", "global.processedFolder","")));
if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
call("ij.Prefs.set", "global.controlFolder", call("ij.Prefs.get", "global.inputFolder","")+"controlData"+File.separator());
if (File.isDirectory(call("ij.Prefs.get", "global.controlFolder",""))==false) File.makeDirectory(call("ij.Prefs.get", "global.controlFolder",""));
if (call("ij.Prefs.get", "global.advancedUserMode",false)) setAdvancedUserParameters();

images=getFileList(call("ij.Prefs.get", "global.processedFolder",""));
stages=newArray(parseInt(call("ij.Prefs.get","global.stagesNumber", -1)));
for (i=0; i<stages.length; i++) {
	tempText="global.stage"+i;
	stages[i]=call("ij.Prefs.get", tempText,"");
}
maxChannel=getMaxChannel();
analysedImages=0;
Table.create("imageAnalysis");
Table.showRowIndexes(false);
initializeImageTable("imageAnalysis");
do	{
	counter=findStageFiles(stages, call("ij.Prefs.get", "global.processedFolder",""),images,counter); 
	if (counter>-1) {
		call("ij.Prefs.set", "global.channelErrorMessageShown", false);
		showProgress(counter, images.length);
		message="image "+d2s(counter, 0)+" of "+d2s(images.length, 0);
		showStatus(message);		
		roiManager("reset");
		path=call("ij.Prefs.get", "global.processedFolder","")+images[counter];
		roiPath=call("ij.Prefs.get", "global.processedFolder","")+"user-defined_"+replace(images[counter],".tif", ".roi");
		counter++;
		open(path);
		name=getTitle();
		getPixelSize(unit, pixelWidth, pixelHeight);
		if (pixelWidth!=pixelHeight && call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the macro will assume pixels are square, using the pixelWidth as pixelHeight");
		Stack.getDimensions(width, height, channels, slices, frames);
		call("ij.Prefs.set", "global.channelsNumber",channels);
		if ((slices>1||frames>1)&& call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the image contains more slices/frames than expected");
		if (call("ij.Prefs.get", "global.smooth",false)) {
		 	for (i=0; i<channels+1; i++) {
		 		Stack.setChannel(i);
		 		run("Smooth");
		 	}
		}
		Table.set("Type", analysedImages, substring(name,0,indexOf(name,"_")),"imageAnalysis");
		Table.set("Image name",analysedImages, substring(name,0,indexOf(name,".")),"imageAnalysis");		
		Table.set("Comment",analysedImages, "","imageAnalysis");
		Table.update("imageAnalysis");
		checkChannels(channels, maxChannel, "imageAnalysis", analysedImages, substring(name,0,indexOf(name,".")));
		if (call("ij.Prefs.get", "global.channelTestPassed", false)) {
			getReferenceRoi(name, roiPath, analysedImages, "imageAnalysis");
			run("Select None");
			if (parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1))>-1){
				if (call("ij.Prefs.get", "global.showReferenceRoiValues",false)) measureReferenceIntensities("imageAnalysis", analysedImages, name);
				getRawAxisRoi(name, "imageAnalysis", analysedImages, true, pixelWidth);
				refineRawAxisRoi(name,"imageAnalysis", analysedImages, true, pixelWidth);	
				if (call("ij.Prefs.get", "global.saveROIs", false)) saveRois(name);
			}
		}	
		close(name);
		analysedImages++;	
	}
}
while (counter>-1);
if (analysedImages==0) showMessage("There are no meiosis stage image to analyse!");
else 
	{
	burnParameters("imageAnalysis", analysedImages);
	selectWindow("imageAnalysis");
	resultName=call("ij.Prefs.get", "global.processedFolder","")+"lengths.xls";
	saveAs("Results", resultName);
	}
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(false);

//////

</macro>
</line>


///////////////////////////////////////////////////////////////////////////////////////////////

<line>
<button>
label=Measure synapse length
bgcolor=#cbbeb5
icon=noicon
arg=<macro>
call("ij.Prefs.set", "global.lastImageFileProcessed",0);
call("ij.Prefs.set", "global.tool","Measure synapse length");
roiManager("Show None");
if (isOpen("synapse.xls")) {
	selectWindow("synapse.xls");
	close("synapse.xls");
}

if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(true);
nucleusThresholds=newArray(parseInt(call("ij.Prefs.get", "global.nucleusThresholdsNumber",-1)));
for(i=0; i<	nucleusThresholds.length; i++) {
	tempText="global.nucleusThreshold"+i;
	nucleusThresholds[i]=call("ij.Prefs.get", tempText, "");
}
axisThresholds=newArray(parseInt(call("ij.Prefs.get", "global.axisThresholdsNumber",-1)));
for(i=0; i<	axisThresholds.length; i++) {
	tempText="global.axisThreshold"+i;
	axisThresholds[i]=call("ij.Prefs.get", tempText, "");
}
synapsisThresholds=newArray(parseInt(call("ij.Prefs.get", "global.synapsisThresholdsNumber",-1)));
for(i=0; i<	synapsisThresholds.length; i++) {
	tempText="global.synapsisThreshold"+i;
	synapsisThresholds[i]=call("ij.Prefs.get", tempText, "");
}	

run("Close All"); 
run("Clear Results");
ROIModes=newArray("user-defined ROI", "nucleus threshold");
Dialog.create("Measurements parameters");
Dialog.addCheckbox("Use advanced user mode", call("ij.Prefs.get", "global.advancedUserMode",false));
Dialog.addChoice("Measurement mode", ROIModes, call("ij.Prefs.get", "global.ROImode",""));
Dialog.addMessage("If nucleus threshold mode selected");
Dialog.addNumber("   Nucleus channel:", call("ij.Prefs.get", "global.nucleusChannel",-1));
Dialog.addChoice("   Threshold type for nucleus detection", nucleusThresholds, call("ij.Prefs.get", "global.nucleusThreshold",""));
Dialog.addMessage("Axis Parameters");	
Dialog.addMessage("   Whole Axis Detection Parameters");
Dialog.addNumber("   Whole axis channel:", call("ij.Prefs.get", "global.wholeAxisChannel",-1));
Dialog.addChoice("   Threshold type for whole axis detection", axisThresholds, call("ij.Prefs.get", "global.axisThreshold",""));
Dialog.addChoice("Synapse mode", newArray("Use synapsed axis channel","Use non-synapsed axis channel"), call("ij.Prefs.get", "global.synapsisMode",""));
Dialog.addNumber("   synapsed/non-synapsed channel:", call("ij.Prefs.get", "global.synapsisReferenceChannel",-1));
Dialog.addChoice("   Threshold type for syn./non-syn. channel", synapsisThresholds, call("ij.Prefs.get", "global.synapsisThreshold","Huang"));
Dialog.addMessage("Detection parameters (applies to all axis types");
Dialog.addNumber("   Minimal whole axis size in pixels:", call("ij.Prefs.get", "global.smallestSize", -1));	
Dialog.addNumber("Measure axes ROIs' channel",call("ij.Prefs.get", "global.measurementChannel",-1), 0, 1, " intensity (use -1 if none to be added)");
Dialog.addToSameRow();
Dialog.addCheckbox(" add axes channels intensity", call("ij.Prefs.get", "global.measureAxesChannelsIntensities",false));
Dialog.addCheckbox("Save ROIs", call("ij.Prefs.get", "global.saveROIs", false));
Dialog.addDirectory("Cropped images directory", call("ij.Prefs.get", "global.processedFolder",""));	
Dialog.show();
call("ij.Prefs.set", "global.advancedUserMode",Dialog.getCheckbox());
call("ij.Prefs.set", "global.ROImode", Dialog.getChoice());
call("ij.Prefs.set", "global.nucleusChannel", Dialog.getNumber());	
call("ij.Prefs.set", "global.nucleusThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.wholeAxisChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.axisThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.synapsisMode",Dialog.getChoice());
call("ij.Prefs.set", "global.synapsisReferenceChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.synapsisThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.smallestSize", Dialog.getNumber());
call("ij.Prefs.set", "global.usesMultiplePruningMethods",false);
call("ij.Prefs.set", "global.validPruningMethods",1);
call("ij.Prefs.set", "global.skeletonize",true);
call("ij.Prefs.set", "global.showAxesValues", true);
call("ij.Prefs.set", "global.showFociValues", false);
call("ij.Prefs.set", "global.colocalisation", false);
call("ij.Prefs.set", "global.measurementChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.measureAxesChannelsIntensities", Dialog.getCheckbox());
call("ij.Prefs.set", "global.measureFociChannelsIntensities", false);
call("ij.Prefs.set", "global.saveROIs", Dialog.getCheckbox());
call("ij.Prefs.set", "global.processedFolder",Dialog.getString());
if (call("ij.Prefs.get", "global.processedFolder","")=="") {
	showMessageWithCancel("warning","No input data folder was set");
	return;
}
if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
call("ij.Prefs.set", "global.inputFolder",File.getParent(call("ij.Prefs.get", "global.processedFolder","")));
if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
call("ij.Prefs.set", "global.controlFolder", call("ij.Prefs.get", "global.inputFolder","")+"controlData"+File.separator());
if (File.isDirectory(call("ij.Prefs.get", "global.controlFolder",""))==false) File.makeDirectory(call("ij.Prefs.get", "global.controlFolder",""));
if (parseInt(call("ij.Prefs.get", "global.synapsisReferenceChannel",-1))==parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))) {
	showMessageWithCancel("warning","whole axis and synapsed/non synapsed axis channels are identical");
	return;
}
if (call("ij.Prefs.get", "global.advancedUserMode",false)) setAdvancedUserParameters();
images=getFileList(call("ij.Prefs.get", "global.processedFolder",""));
stages=newArray(parseInt(call("ij.Prefs.get","global.stagesNumber", -1)));
for (i=0; i<stages.length; i++) {
	tempText="global.stage"+i;
	stages[i]=call("ij.Prefs.get", tempText,"");
}
maxChannel=getMaxChannel();
analysedImages=0;
Table.create("imageAnalysis");
Table.showRowIndexes(false);
initializeImageTable("imageAnalysis");
do {
	counter=findStageFiles(stages, call("ij.Prefs.get", "global.processedFolder",""),images,counter); 
	if (counter>-1){
		call("ij.Prefs.set", "global.channelErrorMessageShown", false);
		showProgress(counter, images.length);
		message="image "+d2s(counter, 0)+" of "+d2s(images.length, 0);
		showStatus(message);		
		roiManager("reset");
		path=call("ij.Prefs.get", "global.processedFolder","")+images[counter];
		roiPath=call("ij.Prefs.get", "global.processedFolder","")+"user-defined_"+replace(images[counter],".tif", ".roi");
		counter++;
		open(path);
		name=getTitle();
		getPixelSize(unit, pixelWidth, pixelHeight);
		if (pixelWidth!=pixelHeight && call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the macro will assume pixels are square, using the pixelWidth as pixelHeight");
		Stack.getDimensions(width, height, channels, slices, frames);
		call("ij.Prefs.set", "global.channelsNumber",channels);
		if ((slices>1||frames>1)&& call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the image contains more slices/frames than expected");
		if (call("ij.Prefs.get", "global.smooth",false)) {
		 	for (i=0; i<channels+1; i++) {
		 		Stack.setChannel(i);
		 		run("Smooth");
		 	}
		}
		Table.set("Type", analysedImages, substring(name,0,indexOf(name,"_")),"imageAnalysis");
		Table.set("Image name",analysedImages, substring(name,0,indexOf(name,".")),"imageAnalysis");	
		Table.set("Comment", analysedImages,"","imageAnalysis");
		Table.update("imageAnalysis");
		checkChannels(channels, maxChannel, "imageAnalysis", analysedImages, substring(name,0,indexOf(name,".")));
		if (call("ij.Prefs.get", "global.channelTestPassed", false)) {
			getReferenceRoi(name, roiPath, analysedImages, "imageAnalysis");
			run("Select None");
			if (parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1))>-1){
				if (call("ij.Prefs.get", "global.showReferenceRoiValues",false)) measureReferenceIntensities("imageAnalysis", analysedImages, name);
				getRawAxisRoi(name, "imageAnalysis", analysedImages, true, pixelWidth);
				refineRawAxisRoi(name,"imageAnalysis", analysedImages, true, pixelWidth);
				getRawAxisRoi(name, "imageAnalysis", analysedImages, false, pixelWidth);
				refineRawAxisRoi(name,"imageAnalysis", analysedImages, false, pixelWidth);
				if (call("ij.Prefs.get", "global.saveROIs", false)) saveRois(name);
			}
		}
		close(name);
		analysedImages++;		
	}
}
while (counter>-1);

if (analysedImages==0) showMessage("There are no meiosis stage image to analyse!");	
else 
	{
	burnParameters("imageAnalysis", analysedImages);
	selectWindow("imageAnalysis");
	resultName=call("ij.Prefs.get", "global.processedFolder","")+"synapse.xls";
	saveAs("Results", resultName);
	}
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(false);

//////
</macro>
</line>



///////////////////////////////////////////////////////////////////////////////////////////////

<line>
<button>
label=Count axis and off-axis foci in one channel
bgcolor=#468499
icon=noicon
arg=<macro>
call("ij.Prefs.set", "global.lastImageFileProcessed",0);
call("ij.Prefs.set", "global.tool","Count axis and off-axis foci in one channel");

if (isOpen("foci.xls")) {
	selectWindow("foci.xls");
	close("foci.xls");
}

if (isOpen("individualFoci.xls")) {
	selectWindow("individualFoci.xls");
	close("individualFoci.xls");
}
run("Set Measurements...", "area redirect=None decimal=3");
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(true);

run("Close All"); 
run("Clear Results");
nucleusThresholds=newArray(parseInt(call("ij.Prefs.get", "global.nucleusThresholdsNumber",-1)));
for(i=0; i<	nucleusThresholds.length; i++) {
	tempText="global.nucleusThreshold"+i;
	nucleusThresholds[i]=call("ij.Prefs.get", tempText, "");
}
axisThresholds=newArray(parseInt(call("ij.Prefs.get", "global.axisThresholdsNumber",-1)));
for(i=0; i<	axisThresholds.length; i++) {
	tempText="global.axisThreshold"+i;
	axisThresholds[i]=call("ij.Prefs.get", tempText, "");
}
fociThresholds=newArray(parseInt(call("ij.Prefs.get", "global.fociThresholdsNumber",-1)));
for(i=0; i<	fociThresholds.length; i++) {
	tempText="global.fociThreshold"+i;
	fociThresholds[i]=call("ij.Prefs.get", tempText, "");
}
ROIModes=newArray("user-defined ROI", "nucleus threshold");
Dialog.create("Measurements parameters");
Dialog.addCheckbox("Use advanced user mode", call("ij.Prefs.get", "global.advancedUserMode",false));
Dialog.addChoice("Measurement mode", ROIModes, call("ij.Prefs.get", "global.ROImode",""));
Dialog.addMessage("If nucleus threshold mode selected");
Dialog.addNumber("   Nucleus channel:", call("ij.Prefs.get", "global.nucleusChannel",-1));
Dialog.addChoice("   Threshold type for nucleus detection", nucleusThresholds, call("ij.Prefs.get", "global.nucleusThreshold",""));
Dialog.addMessage("Axis and foci Parameters");	
Dialog.addMessage("   Axis Detection Parameters");
Dialog.addNumber("   Axis channel:", call("ij.Prefs.get", "global.wholeAxisChannel",-1));
Dialog.addChoice("   Threshold type for axis detection", axisThresholds, call("ij.Prefs.get", "global.axisThreshold",""));
Dialog.addNumber("   Minimal axis size in pixels:", call("ij.Prefs.get", "global.smallestSize", -1));
call("ij.Prefs.set", "global.usesMultiplePruningMethods",false);
call("ij.Prefs.set", "global.validPruningMethods",1);	
Dialog.addCheckbox("   Measure axis length", call("ij.Prefs.get", "global.skeletonize",false));
Dialog.addMessage("   Foci Detection Parameters");
Dialog.addChoice("   on/off axis foci detection", newArray("using masks","within ROI"), call("ij.Prefs.get", "global.fociDetectionMode",""));
Dialog.addChoice("   foci detection threshold", fociThresholds,call("ij.Prefs.get", "global.fociThreshold",""));
Dialog.addNumber("   Foci channel:", call("ij.Prefs.get", "global.fociChannel",-1));
Dialog.addToSameRow();
Dialog.addNumber("   Noise tolerance for foci detection:", call("ij.Prefs.get", "global.noise", -1));
Dialog.addNumber("Measure foci ROIs' channel",call("ij.Prefs.get", "global.measurementChannel",-1), 0, 1, " intensity (use -1 if none to be added)");
Dialog.addToSameRow();
Dialog.addCheckbox(" add foci channel intensity", call("ij.Prefs.get", "global.measureFociChannelsIntensities",false));
Dialog.addCheckbox("Save ROIs", call("ij.Prefs.get", "global.saveROIs", false));
Dialog.addDirectory("Cropped images directory", call("ij.Prefs.get", "global.processedFolder",""));	
Dialog.show();
call("ij.Prefs.set", "global.advancedUserMode",Dialog.getCheckbox());
call("ij.Prefs.set", "global.ROImode", Dialog.getChoice());
call("ij.Prefs.set", "global.nucleusChannel", Dialog.getNumber());	
call("ij.Prefs.set", "global.nucleusThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.wholeAxisChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.axisThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.smallestSize", Dialog.getNumber());
call("ij.Prefs.set", "global.usesMultiplePruningMethods",false);
call("ij.Prefs.set", "global.validPruningMethods",1);
call("ij.Prefs.set", "global.skeletonize",Dialog.getCheckbox());
call("ij.Prefs.set", "global.fociType","axis");
call("ij.Prefs.set", "global.toolUsesBothAxisAndOffAxis",true);
call("ij.Prefs.set", "global.fociDetectionMode",Dialog.getChoice());
call("ij.Prefs.set", "global.fociThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.fociChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.noise",Dialog.getNumber());
call("ij.Prefs.set", "global.showAxesValues", false);
call("ij.Prefs.set", "global.showFociValues",true);
call("ij.Prefs.set", "global.colocalisation", false);
call("ij.Prefs.set", "global.measurementChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.measureAxesChannelsIntensities",false);
call("ij.Prefs.set", "global.measureFociChannelsIntensities", Dialog.getCheckbox());
call("ij.Prefs.set", "global.saveROIs", Dialog.getCheckbox());
call("ij.Prefs.set", "global.processedFolder",Dialog.getString());
if (call("ij.Prefs.get", "global.processedFolder","")=="") {
	showMessageWithCancel("warning","No input data folder was set");
	return;
}
if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
call("ij.Prefs.set", "global.inputFolder",File.getParent(call("ij.Prefs.get", "global.processedFolder","")));
if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
call("ij.Prefs.set", "global.controlFolder", call("ij.Prefs.get", "global.inputFolder","")+"controlData"+File.separator());
if (File.isDirectory(call("ij.Prefs.get", "global.controlFolder",""))==false) File.makeDirectory(call("ij.Prefs.get", "global.controlFolder",""));
if (parseInt(call("ij.Prefs.get", "global.fociChannel",-1))==parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))) {
	showMessageWithCancel("warning","whole axis and foci channels are identical");
	return;
}
if (call("ij.Prefs.get", "global.advancedUserMode",false)) setAdvancedUserParameters();
images=getFileList(call("ij.Prefs.get", "global.processedFolder",""));
stages=newArray(parseInt(call("ij.Prefs.get","global.stagesNumber", -1)));
for (i=0; i<stages.length; i++) {
	tempText="global.stage"+i;
	stages[i]=call("ij.Prefs.get", tempText,"");
}
maxChannel=getMaxChannel();
analysedImages=0;
Table.create("imageAnalysis");
Table.showRowIndexes(false);
initializeImageTable("imageAnalysis");
analysedParticles=0;
if (call("ij.Prefs.get", "global.showFociValues",false)&&call("ij.Prefs.get", "global.showIndividualFoci", false)&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false))) {
	Table.create("particleAnalysis");
	Table.showRowIndexes(false);
	initializeParticleTable("particleAnalysis");
}	
do
	{
	counter=findStageFiles(stages, call("ij.Prefs.get", "global.processedFolder",""),images,counter); 
	if (counter>-1)
		{
		call("ij.Prefs.set", "global.channelErrorMessageShown", false);
		showProgress(counter, images.length);
		message="image "+d2s(counter, 0)+" of "+d2s(images.length, 0);
		showStatus(message);		
		roiManager("reset");
		path=call("ij.Prefs.get", "global.processedFolder","")+images[counter];
		roiPath=call("ij.Prefs.get", "global.processedFolder","")+"user-defined_"+replace(images[counter],".tif", ".roi");
		counter++;
		open(path);
		name=getTitle();
		getPixelSize(unit, pixelWidth, pixelHeight);
		if (pixelWidth!=pixelHeight && call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the macro will assume pixels are square, using the pixelWidth as pixelHeight");
		Stack.getDimensions(width, height, channels, slices, frames);
		call("ij.Prefs.set", "global.channelsNumber",channels);
		if ((slices>1||frames>1)&& call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the image contains more slices/frames than expected");
		if (call("ij.Prefs.get", "global.smooth",false)) {
		 	for (i=0; i<channels+1; i++) {
		 		Stack.setChannel(i);
		 		run("Smooth");
		 	}
		}
		Table.set("Type", analysedImages, substring(name,0,indexOf(name,"_")),"imageAnalysis");
		Table.set("Image name",analysedImages, substring(name,0,indexOf(name,".")),"imageAnalysis");	
		Table.set("Comment", analysedImages,"","imageAnalysis");
		Table.update("imageAnalysis");
		checkChannels(channels, maxChannel, "imageAnalysis", analysedImages, substring(name,0,indexOf(name,".")));
		if (call("ij.Prefs.get", "global.channelTestPassed", false)) {
			getReferenceRoi(name, roiPath, analysedImages, "imageAnalysis");
			run("Select None");
			if (parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1))>-1){
				if (call("ij.Prefs.get", "global.showReferenceRoiValues",false)) measureReferenceIntensities("imageAnalysis", analysedImages, name);
				getRawAxisRoi(name, "imageAnalysis", analysedImages, true, pixelWidth);
				refineRawAxisRoi(name, "imageAnalysis", analysedImages, true, pixelWidth);
				call("ij.Prefs.set", "global.totalFociRoiIndex",-1);
				countFoci("", "imageAnalysis", analysedImages, "axis", call("ij.Prefs.get", "global.noise", -1), call("ij.Prefs.get", "global.fociChannel",-1), name);
				getOffAxisRoi("imageAnalysis", analysedImages);
				countFoci("", "imageAnalysis", analysedImages, "off-axis", call("ij.Prefs.get", "global.noise", -1), call("ij.Prefs.get", "global.fociChannel",-1), name);
				if((call("ij.Prefs.get", "global.showFociValues",false)&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)))) {
					if (call("ij.Prefs.get", "global.showParticleValues",false)){
						if (call("ij.Prefs.get", "global.showIndividualFoci", false)) analysedParticles=analyseParticles(name, "imageAnalysis", analysedImages, "particleAnalysis", analysedParticles);
   						else analysedParticles=analyseParticles(name, "imageAnalysis", analysedImages, "", analysedParticles);
					}
					if (call("ij.Prefs.get", "global.showMaximumValues",false)) analyseMaxima(name, "imageAnalysis", analysedImages);
				}
				purgeRois();
				if (call("ij.Prefs.get", "global.saveROIs", false)) saveRois(name);
			}
		}		
		close(name);
		analysedImages++;		
		}
	}
while (counter>-1);
if (analysedImages==0) {showMessage("There are no meiosis stage image to analyse!");}	
else 
	{
	if (call("ij.Prefs.get", "global.showFociValues",false)&&call("ij.Prefs.get", "global.showIndividualFoci", false)&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false))) {
		selectWindow("particleAnalysis");
		resultName=call("ij.Prefs.get", "global.processedFolder","")+"individualFoci.xls";
		saveAs("Results", resultName);
	}
	burnParameters("imageAnalysis", analysedImages);
	selectWindow("imageAnalysis");
	resultName=call("ij.Prefs.get", "global.processedFolder","")+"foci.xls";
	saveAs("Results", resultName);
}
	
	
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(false);

/////
</macro>
</line>

/////////////////////////////////////////////////////////////////////////////////////////////
<line>
<button>
label=Count axis/off-axis foci in two channels and colocalize
bgcolor=#468499
icon=noicon
arg=<macro>
call("ij.Prefs.set", "global.lastImageFileProcessed",0);
call("ij.Prefs.set", "global.tool","Count axis/off-axis foci in two channels and colocalize");
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(true);
if (isOpen("2axisFoci.xls")) {
	selectWindow("2axisFoci.xls");
	close("2axisFoci.xls");
}
if (isOpen("2off-axisFoci.xls")) {
	selectWindow("2off-axisFoci.xls");
	close("2off-axisFoci.xls");
}
if (isOpen("individual2axisFoci.xls")) {
	selectWindow("individual2axisFoci.xls");
	close("individual2axisFoci.xls");
}
if (isOpen("individual2off-axisFoci.xls")) {
	selectWindow("individual2off-axisFoci.xls");
	close("individual2off-axisFoci.xls");
}

run("Close All"); 
run("Clear Results");
nucleusThresholds=newArray(parseInt(call("ij.Prefs.get", "global.nucleusThresholdsNumber",-1)));
for(i=0; i<	nucleusThresholds.length; i++) {
	tempText="global.nucleusThreshold"+i;
	nucleusThresholds[i]=call("ij.Prefs.get", tempText, "");
}
axisThresholds=newArray(parseInt(call("ij.Prefs.get", "global.axisThresholdsNumber",-1)));
for(i=0; i<	axisThresholds.length; i++) {
	tempText="global.axisThreshold"+i;
	axisThresholds[i]=call("ij.Prefs.get", tempText, "");
}
fociThresholds=newArray(parseInt(call("ij.Prefs.get", "global.fociThresholdsNumber",-1)));
for(i=0; i<	fociThresholds.length; i++) {
	tempText="global.fociThreshold"+i;
	fociThresholds[i]=call("ij.Prefs.get", tempText, "");
}
ROIModes=newArray("user-defined ROI", "nucleus threshold");

Dialog.create("Measurements parameters");
Dialog.addCheckbox("Use advanced user mode", call("ij.Prefs.get", "global.advancedUserMode",false));
Dialog.addChoice("Measurement mode", ROIModes, call("ij.Prefs.get", "global.ROImode",""));
Dialog.addMessage("If nucleus threshold mode selected");
Dialog.addNumber("   Nucleus channel:", call("ij.Prefs.get", "global.nucleusChannel",-1));
Dialog.addChoice("   Threshold type for nucleus detection", nucleusThresholds, call("ij.Prefs.get", "global.nucleusThreshold",""));
Dialog.addMessage("Axis and foci Parameters");	
Dialog.addMessage("   Axis Detection Parameters");
Dialog.addNumber("   Axis channel:", call("ij.Prefs.get", "global.wholeAxisChannel",-1));
Dialog.addChoice("   Threshold type for axis detection", axisThresholds, call("ij.Prefs.get", "global.axisThreshold",""));
Dialog.addNumber("   Minimal axis size in pixels:", call("ij.Prefs.get", "global.smallestSize", -1));
Dialog.addCheckbox("   Measure axis length", call("ij.Prefs.get", "global.skeletonize",false));
Dialog.addMessage("   Foci Detection Parameters");
Dialog.addChoice("   foci type", newArray("axis","off-axis"), call("ij.Prefs.get", "global.fociType",""));
Dialog.addChoice("   Axis foci detection", newArray("using masks","within ROI"), call("ij.Prefs.get", "global.fociDetectionMode",""));
Dialog.addChoice("   Foci detection threshold", fociThresholds,call("ij.Prefs.get", "global.fociThreshold",""));
Dialog.addNumber("   Foci A channel:", call("ij.Prefs.get", "global.fociChannelA",-1));
Dialog.addToSameRow();
Dialog.addNumber("   Noise tolerance for foci A detection:", call("ij.Prefs.get", "global.noiseA", -1));
Dialog.addNumber("   Foci B channel:", call("ij.Prefs.get", "global.fociChannelB",-1));
Dialog.addToSameRow();
Dialog.addNumber("   Noise tolerance for foci B detection:", call("ij.Prefs.get", "global.noiseB", -1));
Dialog.addCheckbox("Compute colocalisation", call("ij.Prefs.get", "global.colocalisation",false));
Dialog.addToSameRow();
Dialog.addNumber("    Maximal distance in um to consider as colocalized:", call("ij.Prefs.get", "global.colocalisationDistance",-1));
Dialog.addCheckbox("Get estimation of colocalisation with random images", call("ij.Prefs.get", "global.randomisation", false));
Dialog.addToSameRow();
Dialog.addNumber("    Number of randomisation cycles", call("ij.Prefs.get", "global.randomCycles",-1));
Dialog.addCheckbox("Show random distribution vs real value", call("ij.Prefs.get", "global.showPValue", false));
Dialog.addNumber("Measure foci ROIs' channel",call("ij.Prefs.get", "global.measurementChannel",-1), 0, 1, " intensity (use -1 if none to be added)");
Dialog.addToSameRow();
Dialog.addCheckbox(" add foci channels intensities", call("ij.Prefs.get", "global.measureFociChannelsIntensities",false));
Dialog.addCheckbox("Save ROIs", call("ij.Prefs.get", "global.saveROIs", false));
Dialog.addDirectory("Cropped images directory", call("ij.Prefs.get", "global.processedFolder",""));	
Dialog.show();
call("ij.Prefs.set", "global.advancedUserMode",Dialog.getCheckbox());
call("ij.Prefs.set", "global.ROImode",Dialog.getChoice());
call("ij.Prefs.set", "global.nucleusChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.nucleusThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.wholeAxisChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.axisThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.smallestSize", Dialog.getNumber());
call("ij.Prefs.set", "global.usesMultiplePruningMethods",false);
call("ij.Prefs.set", "global.validPruningMethods",1);
call("ij.Prefs.set", "global.skeletonize",Dialog.getCheckbox());
call("ij.Prefs.set", "global.fociType",Dialog.getChoice());
call("ij.Prefs.set", "global.toolUsesBothAxisAndOffAxis",false);
call("ij.Prefs.set", "global.fociDetectionMode",Dialog.getChoice());
call("ij.Prefs.set", "global.fociThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.fociChannelA",Dialog.getNumber());
call("ij.Prefs.set", "global.noiseA", Dialog.getNumber());
call("ij.Prefs.set", "global.fociChannelB",Dialog.getNumber());
call("ij.Prefs.set", "global.noiseB", Dialog.getNumber());
call("ij.Prefs.set", "global.colocalisation",Dialog.getCheckbox());
call("ij.Prefs.set", "global.colocalisationDistance",Dialog.getNumber());
call("ij.Prefs.set", "global.randomisation", Dialog.getCheckbox());
call("ij.Prefs.set", "global.randomCycles",Dialog.getNumber());
call("ij.Prefs.set", "global.showPValue", Dialog.getCheckbox());
call("ij.Prefs.set", "global.showAxesValues", false);
call("ij.Prefs.set", "global.showFociValues",true);
call("ij.Prefs.set", "global.measurementChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.measureAxesChannelsIntensities",false);
call("ij.Prefs.set", "global.measureFociChannelsIntensities", Dialog.getCheckbox());
call("ij.Prefs.set", "global.saveROIs", Dialog.getCheckbox());
call("ij.Prefs.set", "global.processedFolder",Dialog.getString());
if (call("ij.Prefs.get", "global.processedFolder","")=="") {
	showMessageWithCancel("warning","No input data folder was set");
	return;
}
if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
call("ij.Prefs.set", "global.inputFolder",File.getParent(call("ij.Prefs.get", "global.processedFolder","")));
if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
call("ij.Prefs.set", "global.controlFolder", call("ij.Prefs.get", "global.inputFolder","")+"controlData"+File.separator());
if (File.isDirectory(call("ij.Prefs.get", "global.controlFolder",""))==false) File.makeDirectory(call("ij.Prefs.get", "global.controlFolder",""));
if (parseInt(call("ij.Prefs.get", "global.fociChannelA",-1))==parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))) {
	showMessageWithCancel("warning","whole axis and fociA channels are identical");
	return;
}
if (parseInt(call("ij.Prefs.get", "global.fociChannelB",-1))==parseInt(call("ij.Prefs.get", "global.wholeAxisChannel",-1))) {
	showMessageWithCancel("warning","whole axis and foci B channels are identical");
	return;
}
if (parseInt(call("ij.Prefs.get", "global.fociChannelA",-1))==parseInt(call("ij.Prefs.get", "global.fociChannelB",-1))) {
	showMessageWithCancel("warning","foci A and B channels are identical");
	return;
}
if (call("ij.Prefs.get", "global.advancedUserMode",false)) setAdvancedUserParameters();
images=getFileList(call("ij.Prefs.get", "global.processedFolder",""));
stages=newArray(parseInt(call("ij.Prefs.get","global.stagesNumber", -1)));
for (i=0; i<stages.length; i++) {
	tempText="global.stage"+i;
	stages[i]=call("ij.Prefs.get", tempText,"");
}
maxChannel=getMaxChannel();
analysedImages=0;
Table.create("imageAnalysis");
Table.showRowIndexes(false);
initializeImageTable("imageAnalysis");
analysedParticles=0;
if (call("ij.Prefs.get", "global.showFociValues",false)&&call("ij.Prefs.get", "global.showIndividualFoci", false)&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false))) {
	Table.create("particleAnalysis");
	Table.showRowIndexes(false);
	initializeParticleTable("particleAnalysis");
}
do	{
	counter=findStageFiles(stages, call("ij.Prefs.get", "global.processedFolder",""),images,counter); 
	if (counter>-1) {
		call("ij.Prefs.set", "global.channelErrorMessageShown", false);
		call("ij.Prefs.set", "global.pValueErrorMessageShown", false);
		showProgress(counter, images.length);
		message="image "+d2s(counter, 0)+" of "+d2s(images.length, 0);
		showStatus(message);		
		roiManager("reset");
		path=call("ij.Prefs.get", "global.processedFolder","")+images[counter];
		roiPath=call("ij.Prefs.get", "global.processedFolder","")+"user-defined_"+replace(images[counter],".tif", ".roi");
		counter++;
		open(path);
		name=getTitle();
		getPixelSize(unit, pixelWidth, pixelHeight);
		if (pixelWidth!=pixelHeight && call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the macro will assume pixels are square, using the pixelWidth as pixelHeight");
		Stack.getDimensions(width, height, channels, slices, frames);
		call("ij.Prefs.set", "global.channelsNumber",channels);
		if ((slices>1||frames>1)&& call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the image contains more slices/frames than expected");
		if (call("ij.Prefs.get", "global.smooth",false)) {
		 	for (i=0; i<channels+1; i++) {
		 		Stack.setChannel(i);
		 		run("Smooth");
		 	}
		}
		Table.set("Type", analysedImages, substring(name,0,indexOf(name,"_")), "imageAnalysis");
		Table.set("Image name",analysedImages, substring(name,0,indexOf(name,".")), "imageAnalysis");
		Table.set("Comment", analysedImages,"", "imageAnalysis");
		Table.update("imageAnalysis");
		checkChannels(channels, maxChannel, "imageAnalysis", analysedImages, substring(name,0,indexOf(name,".")));
		if (call("ij.Prefs.get", "global.channelTestPassed", false)) {
			getReferenceRoi(name, roiPath, analysedImages, "imageAnalysis");
			run("Select None");
			if (parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1))>-1){
				if (call("ij.Prefs.get", "global.showReferenceRoiValues",false)) measureReferenceIntensities("imageAnalysis", analysedImages, name);	
				getRawAxisRoi(name, "imageAnalysis", analysedImages, true, pixelWidth);
				refineRawAxisRoi(name,"imageAnalysis", analysedImages, true, pixelWidth);
				if (call("ij.Prefs.get", "global.fociType","")=="off-axis") getOffAxisRoi("imageAnalysis", analysedImages);
				call("ij.Prefs.set", "global.totalFociARoiIndex",-1);
				countFoci("A", "imageAnalysis", analysedImages, call("ij.Prefs.get", "global.fociType",""), call("ij.Prefs.get", "global.noiseA", -1), call("ij.Prefs.get", "global.fociChannelA",-1), name);
				tempTextA="global."+call("ij.Prefs.get", "global.fociType","")+"FociARoiIndex";
				call("ij.Prefs.set", "global.totalFociBRoiIndex",-1);
				countFoci("B", "imageAnalysis", analysedImages, call("ij.Prefs.get", "global.fociType",""), call("ij.Prefs.get", "global.noiseB", -1), call("ij.Prefs.get", "global.fociChannelB",-1), name);
				tempTextB="global."+call("ij.Prefs.get", "global.fociType","")+"FociBRoiIndex";	
				
   				if (call("ij.Prefs.get", "global.colocalisation", false)&& parseInt(call("ij.Prefs.get", tempTextA, -1))>-1 && parseInt(call("ij.Prefs.get", tempTextB, -1))>-1) {
					nColocFociA=findColoc(call("ij.Prefs.get", "global.fociType",""), "A", "B", "imageAnalysis",analysedImages);
   					nColocFociB=findColoc(call("ij.Prefs.get", "global.fociType",""), "B", "A", "imageAnalysis",analysedImages);
					if (call("ij.Prefs.get", "global.randomisation", false)) {
						generateRandomColocValue(call("ij.Prefs.get", "global.fociType",""),"A", "B", "imageAnalysis",analysedImages, nColocFociA, name);
						generateRandomColocValue(call("ij.Prefs.get", "global.fociType",""),"B", "A","imageAnalysis",analysedImages, nColocFociB, name);
   					}
				}
				else {
					if (call("ij.Prefs.get", "global.colocalisation", false)){
						tempText="colocalised "+call("ij.Prefs.get", "global.fociType","")+"_foci";
						Table.set(tempText+"A", analysedImages, "", "imageAnalysis");
						Table.set(tempText+"B", analysedImages, "", "imageAnalysis");
						if (call("ij.Prefs.get", "global.randomisation", false)) {
							tempText="Mean randomly colocalised "+call("ij.Prefs.get", "global.fociType","")+"_foci";
							Table.set(tempText+"A", analysedImages, "", "imageAnalysis");
							Table.set(tempText+"B", analysedImages, "", "imageAnalysis");		
						}
					}	
				}
				if((call("ij.Prefs.get", "global.showFociValues",false)&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false)))) {
					if (call("ij.Prefs.get", "global.showIndividualFoci", false)) analysedParticles=analyseParticles(name, "imageAnalysis", analysedImages, "particleAnalysis", analysedParticles);
   					else analysedParticles=analyseParticles(name, "imageAnalysis", analysedImages, "", analysedParticles);
				}
				purgeRois();
				if (call("ij.Prefs.get", "global.saveROIs", false)) saveRois(name);
				close(name);
				analysedImages++;		
			}
		}	
	}
}	
while (counter>-1);

if (analysedImages==0) {showMessage("There are no meiosis stage image to analyse!");}	
else 
	{
	if (call("ij.Prefs.get", "global.showFociValues",false)&&call("ij.Prefs.get", "global.showIndividualFoci", false)&&(parseInt(call("ij.Prefs.get", "global.measurementChannel",-1))>-1||call("ij.Prefs.get", "global.measureFociChannelsIntensities", false))) {
		selectWindow("particleAnalysis");
		resultName=call("ij.Prefs.get", "global.processedFolder","")+"individual2"+call("ij.Prefs.get", "global.fociType","")+"Foci.xls";
		saveAs("Results", resultName);
	}
	burnParameters("imageAnalysis", analysedImages);
	selectWindow("imageAnalysis");
	resultName=call("ij.Prefs.get", "global.processedFolder","")+"2"+call("ij.Prefs.get", "global.fociType","")+"Foci.xls";
	saveAs("Results", resultName);
	}
	
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(false);
  
/////
</macro>
</line>



/////////////////////////////////////////////////////////////
<line>
<button>
label=Start checking results
bgcolor=#b0e0e6
icon=noicon
arg=<macro>
close("*");
roiManager("reset");
macros=newArray("Measure Global intensities", "Count foci in two channels and colocalize", "Measure axis length", "Measure synapse length", "Count axis and off-axis foci in one channel","Count axis/off-axis foci in two channels and colocalize", "Set advanced user parameters");
if (call("ij.Prefs.get", "global.toolset","")=="hemopathies")	macros=newArray("Measure Global intensities", "Count foci in two channels and colocalize");
Dialog.create("Check results");
Dialog.addDirectory("Cropped & analysed images directory", call("ij.Prefs.get", "global.processedFolder",""));	
Dialog.addChoice("Analysis type", macros, call("ij.Prefs.get", "global.tool", ""));
Dialog.show();
call("ij.Prefs.set", "global.processedFolder",Dialog.getString());
call("ij.Prefs.set", "global.tool", Dialog.getChoice());

if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
call("ij.Prefs.set", "global.inputFolder",File.getParent(call("ij.Prefs.get", "global.processedFolder","")));
if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
call("ij.Prefs.set", "global.controlFolder", call("ij.Prefs.get", "global.inputFolder","")+"controlData"+File.separator());
if (File.isDirectory(call("ij.Prefs.get", "global.controlFolder",""))==false) File.makeDirectory(call("ij.Prefs.get", "global.controlFolder",""));

prefix="";
if (call("ij.Prefs.get", "global.tool", "")=="Count axis/off-axis foci in two channels and colocalize") prefix="2"+call("ij.Prefs.get", "global.fociType","")+"Foci";
if (call("ij.Prefs.get", "global.tool", "")=="Count foci in two channels and colocalize") prefix="2Foci";
if (call("ij.Prefs.get","global.tool", "")=="Count axis and off-axis foci in one channel") prefix="foci";
if (call("ij.Prefs.get","global.tool", "")=="Measure synapse length") prefix="synapse";
if (call("ij.Prefs.get","global.tool", "")=="Measure axis length") prefix="lengths";
if (call("ij.Prefs.get","global.tool", "")=="Measure Global intensities") prefix="intensities";
if (call("ij.Prefs.get","global.tool", "")=="Set advanced user parameters") prefix="pruning";
if(!File.isDirectory(call("ij.Prefs.get", "global.controlFolder", ""))) showMessage("error", "No control ROIs/results found for this dataset");
images = getFileList(call("ij.Prefs.get", "global.processedFolder",""));
stages=newArray(parseInt(call("ij.Prefs.get","global.stagesNumber", -1)));
for (i=0; i<stages.length; i++) {
	tempText="global.stage"+i;
	stages[i]=call("ij.Prefs.get", tempText,"");
}

counter=findResultSetFiles(stages, call("ij.Prefs.get", "global.processedFolder",""), prefix, images,0); 
if (counter>-1)	{
	call("ij.Prefs.set", "global.lastImageFileProcessed",counter);
	zipRoiPath=call("ij.Prefs.get", "global.controlFolder","")+prefix+"_RoiSet_"+replace(images[counter],".tif", ".zip");
	if (!File.exists(zipRoiPath)) showMessageWithCancel("error", "No control ROIs/results found for this dataset, run "+call("ij.Prefs.get","global.tool", "")+" macro first");
	else {
		path=call("ij.Prefs.get", "global.processedFolder","")+images[counter];
		if(endsWith(images[counter], ".tif")) open(path);
		else run("Bio-Formats Importer", "open="+path+" autoscale color_mode=Composite view=Hyperstack stack_order=XYCZT");
		run("Remove Overlay");
		roiManager("open", zipRoiPath);
		selectWindow("ROI Manager");
	}
}	
else showMessage("There are no results to display");
</macro>
</line>
/////////////////////////////////////////////////////////////
<line>
<button>
label=Check next result
bgcolor=#b0e0e6
icon=noicon
arg=<macro>
close("*");
roiManager("reset");
prefix="";
if (call("ij.Prefs.get", "global.tool", "")=="") showMessage("error", "Click on start checking results first");
else {
	if (call("ij.Prefs.get", "global.tool", "")=="Count axis/off-axis foci in two channels and colocalize") prefix="2"+call("ij.Prefs.get", "global.fociType","")+"Foci";
	if (call("ij.Prefs.get", "global.tool", "")=="Count foci in two channels and colocalize") prefix="2Foci";
	if (call("ij.Prefs.get","global.tool", "")=="Count axis and off-axis foci in one channel") prefix="foci";
	if (call("ij.Prefs.get","global.tool", "")=="Measure synapse length") prefix="synapse";
	if (call("ij.Prefs.get","global.tool", "")=="Measure axis length") prefix="lengths";
	if (call("ij.Prefs.get","global.tool", "")=="Measure Global intensities") prefix="intensities";
	if (call("ij.Prefs.get","global.tool", "")=="Set advanced user parameters") prefix="pruning";
	counter=parseInt(call("ij.Prefs.get", "global.lastImageFileProcessed",-1));
	if (call("ij.Prefs.get", "global.processedFolder","")=="") {
		call("ij.Prefs.set", "global.processedFolder",getDirectory("Choose the folder containing the cropped and stage-sorted images that were analysed"));
		if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
		call("ij.Prefs.set", "global.inputFolder",File.getParent(call("ij.Prefs.get", "global.processedFolder","")));
		if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
		call("ij.Prefs.set", "global.controlFolder", call("ij.Prefs.get", "global.inputFolder","")+"controlData"+File.separator());
		if (File.isDirectory(call("ij.Prefs.get", "global.controlFolder",""))==false) File.makeDirectory(call("ij.Prefs.get", "global.controlFolder",""));
	}

	if(!File.isDirectory(call("ij.Prefs.get", "global.controlFolder", ""))) showMessage("error", "No control ROIs/results found for this dataset");
	images = getFileList(call("ij.Prefs.get", "global.processedFolder",""));
	stages=newArray(parseInt(call("ij.Prefs.get","global.stagesNumber", -1)));
	for (i=0; i<stages.length; i++) {
		tempText="global.stage"+i;
		stages[i]=call("ij.Prefs.get", tempText,"");
	}
	counter++;
	counter=findResultSetFiles(stages, call("ij.Prefs.get", "global.processedFolder",""), prefix,images,counter); 
	if (counter>-1)
		{
		call("ij.Prefs.set", "global.lastImageFileProcessed",counter);
		zipRoiPath=call("ij.Prefs.get", "global.controlFolder","")+prefix+"_RoiSet_"+replace(images[counter],".tif", ".zip");
		if (!File.exists(zipRoiPath)) showMessageWithCancel("error", "No control ROIs/results found for this dataset, run "+call("ij.Prefs.get","global.tool", "")+" macro first");
		else {
			path=call("ij.Prefs.get", "global.processedFolder","")+images[counter];
			if(endsWith(images[counter], ".tif")) open(path);
			else run("Bio-Formats Importer", "open="+path+" autoscale color_mode=Composite view=Hyperstack stack_order=XYCZT");
			run("Remove Overlay");
			roiManager("open", zipRoiPath);
			selectWindow("ROI Manager");
		}
	}		
	else showMessage("There are no more results to display");
}	
</macro>
</line>

/////////////////////////////////

<line>
<button>
label=Set Stages/types parameters
bgcolor=#faebd7
icon=noicon
arg=<macro>
tempNumber = getNumber("number of Stages/types (max "+call("ij.Prefs.get", "global.maxStagesNumber",-1)+"):", call("ij.Prefs.get", "global.stagesNumber",-1));
if (tempNumber<call("ij.Prefs.get", "global.maxStagesNumber", -1)) call("ij.Prefs.set", "global.stagesNumber",tempNumber);
else call("ij.Prefs.set", "global.stagesNumber",call("ij.Prefs.get", "global.maxStagesNumber", -1));
	
Dialog.create("Stages/types parameters");
for(i=0; i<call("ij.Prefs.get", "global.stagesNumber", -1); i++) {
	tempText="global.stage"+i;
	Dialog.addString("Type "+i+":", call("ij.Prefs.get", tempText, ""));
}
Dialog.show();
for(i=0; i<call("ij.Prefs.get", "global.stagesNumber", -1); i++) {
	tempText="global.stage"+i;
	call("ij.Prefs.set", tempText, toLowerCase(Dialog.getString()));
}
</macro>
</line>

//////////////////////////////////////////////////////////////////////////
<line>
<button>
label=Set advanced user parameters
bgcolor=#faebd7
icon=noicon
arg=<macro>

call("ij.Prefs.set", "global.tool","Set advanced user parameters");
call("ij.Prefs.set", "global.usesMultiplePruningMethods",true);
if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(true);
nucleusThresholds=newArray(parseInt(call("ij.Prefs.get", "global.nucleusThresholdsNumber",-1)));
for(i=0; i<	nucleusThresholds.length; i++) {
	tempText="global.nucleusThreshold"+i;
	nucleusThresholds[i]=call("ij.Prefs.get", tempText, "");
}
axisThresholds=newArray(parseInt(call("ij.Prefs.get", "global.axisThresholdsNumber",-1)));
for(i=0; i<	axisThresholds.length; i++) {
	tempText="global.axisThreshold"+i;
	axisThresholds[i]=call("ij.Prefs.get", tempText, "");
}
ROIModes=newArray("user-defined ROI", "nucleus threshold");
presetPruningMethods=newArray(parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)));
presetPruningMethodsDefaults=newArray(parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)));
for(i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)); i++) {
	tempText="global.presetPruningMethod"+i;
	presetPruningMethods[i]=call("ij.Prefs.get", tempText,"");
	tempText="global.isSelectedAxisPruningMode"+i;
	presetPruningMethodsDefaults[i]=call("ij.Prefs.get", tempText,false);
	}
columns=2;
rows=Math.round(parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1))/2);
binaryTools=newArray(parseInt(call("ij.Prefs.get", "global.numberOfDefaultBinaryTools",-1)));
for (i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfDefaultBinaryTools",-1)); i++) {
	tempText="global.defaultBinaryTool"+i;
	binaryTools[i]=call("ij.Prefs.get", tempText, "");
}

Dialog.create("Advanced user parameters");
Dialog.addCheckbox("Smooth original images", call("ij.Prefs.get", "global.smooth",false));
Dialog.addCheckbox("Use the threshold no-reset option", call("ij.Prefs.get", "global.noReset",false));
Dialog.addChoice("Measurement mode", ROIModes, call("ij.Prefs.get", "global.ROImode",""));
Dialog.addMessage("If nucleus threshold mode selected");
Dialog.addNumber("   Nucleus channel:", call("ij.Prefs.get", "global.nucleusChannel",-1));
Dialog.addChoice("   Threshold type for nucleus detection", nucleusThresholds, call("ij.Prefs.get", "global.nucleusThreshold",""));
Dialog.addMessage("Raw Axis Detection Parameters");
Dialog.addNumber("   Axis channel:", call("ij.Prefs.get", "global.wholeAxisChannel",-1));
Dialog.addChoice("   Threshold type for axis detection", axisThresholds, call("ij.Prefs.get", "global.axisThreshold",""));
Dialog.addNumber(" Minimal axis size in pixels:", call("ij.Prefs.get", "global.smallestSize", -1));	
Dialog.addNumber("   Maximum axis circularity:", call("ij.Prefs.get", "global.circ", -1));
Dialog.addCheckbox("   Exclude edges-touching axis", call("ij.Prefs.get", "global.exclude", false));
Dialog.addMessage("Raw Axis processing Parameters");
Dialog.addCheckbox("   Use preset pruning methods", call("ij.Prefs.get", "global.usePresetPruningMethods", false));
Dialog.addCheckboxGroup(rows,columns,presetPruningMethods,presetPruningMethodsDefaults);
Dialog.addNumber("       Use a pruning strength (1 to 8) of ", parseInt(call("ij.Prefs.get", "global.presetPruningStrength",-1)),0,1, " pixels for preset methods");
Dialog.addCheckbox("   Use all possible combination of the following pruning parameters", call("ij.Prefs.get", "global.useCustomPruningMethods", false));
Dialog.addNumber("       Maximum number of processing cycles", call("ij.Prefs.get", "global.customProcessingCycles", -1), 0, 2, "");
Dialog.addChoice("       First binary tool ", binaryTools, call("ij.Prefs.get", "global.customBinaryTool1",""));
Dialog.addChoice("       Second binary tool ", binaryTools, call("ij.Prefs.get", "global.customBinaryTool2",""));
Dialog.addNumber("       Maximum pruning strength (1 to 8)", parseInt(call("ij.Prefs.get", "global.customPruningStrength",-1)),0,1, " pixels");
Dialog.addDirectory("Cropped images directory", call("ij.Prefs.get", "global.processedFolder",""));	
Dialog.show();

call("ij.Prefs.set", "global.smooth",Dialog.getCheckbox());
call("ij.Prefs.set", "global.noReset",Dialog.getCheckbox());
if (call("ij.Prefs.get", "global.noReset",false)) call("ij.Prefs.set", "global.resetStatus","no-reset");
else call("ij.Prefs.set", "global.resetStatus","");
call("ij.Prefs.set", "global.ROImode",Dialog.getChoice());
call("ij.Prefs.set", "global.nucleusChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.nucleusThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.wholeAxisChannel",Dialog.getNumber());
call("ij.Prefs.set", "global.axisThreshold",Dialog.getChoice());
call("ij.Prefs.set", "global.smallestSize", Dialog.getNumber());
call("ij.Prefs.set", "global.circ", Dialog.getNumber());
call("ij.Prefs.set", "global.exclude", Dialog.getCheckbox());
nMethods=0;
call("ij.Prefs.set", "global.usePresetPruningMethods",  Dialog.getCheckbox());
for (i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)); i++) {
	tempText="global.isSelectedAxisPruningMode"+i;
	call("ij.Prefs.set", tempText, Dialog.getCheckbox());
}
if (call("ij.Prefs.get", "global.usePresetPruningMethods", false)) {
	for (i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)); i++) {
		tempText="global.isSelectedAxisPruningMode"+i;
		if (call("ij.Prefs.get", tempText, false)) nMethods++;
	}
	if (nMethods==0) call("ij.Prefs.set", "global.usePresetPruningMethods", false);
}	
call("ij.Prefs.set", "global.presetPruningStrength",Dialog.getNumber());
call("ij.Prefs.set", "global.useCustomPruningMethods", Dialog.getCheckbox());
call("ij.Prefs.set", "global.customProcessingCycles", Dialog.getNumber());
if (parseInt(call("ij.Prefs.get", "global.customProcessingCycles", -1)>100) call("ij.Prefs.set", "global.customProcessingCycles", 100);
if (parseInt(call("ij.Prefs.get", "global.customProcessingCycles", -1)<1) call("ij.Prefs.set", "global.customProcessingCycles", 1);
call("ij.Prefs.set", "global.customBinaryTool1",Dialog.getChoice());
call("ij.Prefs.set", "global.customBinaryTool2",Dialog.getChoice());
call("ij.Prefs.set", "global.customPruningStrength",Dialog.getNumber());
if (call("ij.Prefs.get", "global.useCustomPruningMethods",false)) {
	nTools=0;
	if (call("ij.Prefs.get", "global.customBinaryTool1","")!="Nothing") nTools++;
	if (call("ij.Prefs.get", "global.customBinaryTool2","")!="Nothing") nTools++;
	if (nTools==0 || call("ij.Prefs.get", "global.customProcessingCycles",-1)<1) call("ij.Prefs.set", "global.useCustomPruningMethods",false);
	else nMethods+=nTools*parseInt(call("ij.Prefs.get", "global.customPruningStrength",-1))*parseInt(call("ij.Prefs.get", "global.customProcessingCycles",-1));
}
if (nMethods==0||nMethods==1) {
	call("ij.Prefs.set", "global.usesMultiplePruningMethods",false);
	if (nMethods==0) {
		call("ij.Prefs.set", "global.selectedPruningMethod","None");
		nMethods=1;
	}
	else {
		if (call("ij.Prefs.get", "global.usePresetPruningMethods", false)) {
			for (i=0; i<parseInt(call("ij.Prefs.get", "global.numberOfPresetPruningMethods",-1)); i++) {
				tempText="global.isSelectedAxisPruningMode"+i;
				if (call("ij.Prefs.get", tempText, false)) {
					tempText="global.presetPruningMethod"+i;
					call("ij.Prefs.set", "global.selectedPruningMethod", call("ij.Prefs.get", tempText, ""));
				}
			}	
		}
		else {
			if (call("ij.Prefs.get", "global.useCustomPruningMethods", false)) {
				call("ij.Prefs.set", "global.processingCycles", parseInt(call("ij.Prefs.get", "global.customProcessingCycles", "")));
				call("ij.Prefs.set", "global.binaryTool1",call("ij.Prefs.get", "global.customBinaryTool1", ""));
				call("ij.Prefs.set", "global.binaryTool2",call("ij.Prefs.get", "global.customBinaryTool2", ""));
				call("ij.Prefs.set", "global.pruningStrength", parseInt(call("ij.Prefs.get", "global.customPruningStrength", "")));
				method="Custom ["+call("ij.Prefs.get", "global.binaryTool1", "");
				if (call("ij.Prefs.get", "global.binaryTool2", "")!="Nothing") method+=", "+call("ij.Prefs.get", "global.binaryTool2", "");
				method+="] x"+call("ij.Prefs.get", "global.processingCycles", -1)+" (strength: "+call("ij.Prefs.get", "global.pruningStrength", -1) +")";
				call("ij.Prefs.set", "global.selectedPruningMethod",method);
			}
			else call("ij.Prefs.set", "global.selectedPruningMethod","None");
		}	
	}
}
call("ij.Prefs.set", "global.validPruningMethods",nMethods);
call("ij.Prefs.set", "global.skeletonize",true);
call("ij.Prefs.set", "global.colocalisation",false);
call("ij.Prefs.set", "global.showAxesValues", false);
call("ij.Prefs.set", "global.showFociValues",false);
call("ij.Prefs.set", "global.measureAxesChannelsIntensities",false);
call("ij.Prefs.set", "global.measureFociChannelsIntensities", false);
call("ij.Prefs.set", "global.saveROIs", true);
call("ij.Prefs.set", "global.processedFolder",Dialog.getString());
if (call("ij.Prefs.get", "global.processedFolder","")=="") {
	showMessageWithCancel("warning","No input data folder was set");
	return;
}
if(!endsWith(call("ij.Prefs.get", "global.processedFolder",""), File.separator())) call("ij.Prefs.set", "global.processedFolder",call("ij.Prefs.get", "global.processedFolder","")+File.separator());
call("ij.Prefs.set", "global.inputFolder",File.getParent(call("ij.Prefs.get", "global.processedFolder","")));
if(!endsWith(call("ij.Prefs.get", "global.inputFolder",""), File.separator())) call("ij.Prefs.set", "global.inputFolder",call("ij.Prefs.get", "global.inputFolder","")+File.separator());
call("ij.Prefs.set", "global.controlFolder", call("ij.Prefs.get", "global.inputFolder","")+"controlData"+File.separator());
if (File.isDirectory(call("ij.Prefs.get", "global.controlFolder",""))==false) File.makeDirectory(call("ij.Prefs.get", "global.controlFolder",""));
images=getFileList(call("ij.Prefs.get", "global.processedFolder",""));
stages=newArray(parseInt(call("ij.Prefs.get","global.stagesNumber", -1)));
for (i=0; i<stages.length; i++) {
	tempText="global.stage"+i;
	stages[i]=call("ij.Prefs.get", tempText,"");
}
analysedImages=0;
maxChannel=getMaxChannel();
do	{
	counter=findStageFiles(stages, call("ij.Prefs.get", "global.processedFolder",""),images,counter); 
	if (counter>-1) {
		showProgress(counter, images.length);
		message="image "+d2s(counter, 0)+" of "+d2s(images.length, 0);
		showStatus(message);		
		roiManager("reset");
		path=call("ij.Prefs.get", "global.processedFolder","")+images[counter];
		roiPath=call("ij.Prefs.get", "global.processedFolder","")+"user-defined_"+replace(images[counter],".tif", ".roi");
		counter++;
		open(path);
		name=getTitle();
		getPixelSize(unit, pixelWidth, pixelHeight);
		if (pixelWidth!=pixelHeight && call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the macro will assume pixels are square, using the pixelWidth as pixelHeight");
		Stack.getDimensions(width, height, channels, slices, frames);
		call("ij.Prefs.set", "global.channelsNumber",channels);
		if ((slices>1||frames>1)&& call("ij.Prefs.get", "global.showWarningMessages", false)) showMessageWithCancel("warning","the image contains more slices/frames than expected");
		if (call("ij.Prefs.get", "global.smooth",false)) {
		 	for (i=0; i<channels+1; i++) {
		 		Stack.setChannel(i);
		 		run("Smooth");
		 	}
		}		
		checkChannels(channels, maxChannel, "", -1, substring(name,0,indexOf(name,".")));
		if (call("ij.Prefs.get", "global.channelTestPassed", false)) {
			getReferenceRoi(name, roiPath, -1, "");
			run("Select None");
			if (parseInt(call("ij.Prefs.get", "global.referenceRoiIndex",-1))>-1){
				getRawAxisRoi(name, "", -1, true, pixelWidth);
				refineRawAxisRoi(name,"", -1, true, pixelWidth);	
				if (call("ij.Prefs.get", "global.saveROIs", false)) saveRois(name);
				analysedImages+=parseInt(call("ij.Prefs.get", "global.validPruningMethods",-1))-1;	
			}
		}	
		close(name);
		analysedImages++;	
	}
}
while (counter>-1);
if (analysedImages==0) {showMessage("There are no meiosis stage image to analyse!");}	

if (!call("ij.Prefs.get", "global.debugMode", false)) setBatchMode(false);
</macro>
</line>
/////////////////////////////////

<line>
<button>
label=Set measurements parameters
bgcolor=#faebd7
icon=noicon
arg=<macro>
showAllThresholdMethodsAtStart=call("ij.Prefs.get", "global.showAllThresholdMethods",false);
Dialog.create("Measurements Parameters");
Dialog.addMessage("General parameters");
Dialog.addCheckbox("Show warning message", call("ij.Prefs.get", "global.showWarningMessages",false));
Dialog.addCheckbox("Show images while processing files & keep ROIs", call("ij.Prefs.get", "global.debugMode", false));
Dialog.addMessage("Threshold parameters");
Dialog.addCheckbox("Display the full list of threshold methods", call("ij.Prefs.get", "global.showAllThresholdMethods",false));
Dialog.addMessage("Intensity measurements");
Dialog.addCheckbox("Show intDen values", call("ij.Prefs.get", "global.showIntDenValues",false));
Dialog.addCheckbox("Show mean values", call("ij.Prefs.get", "global.showMeanValues",false));
if (call("ij.Prefs.get", "global.toolset","")=="meiosis") {
	Dialog.addMessage("Length measurements");
	Dialog.addCheckbox("Show rough length estimations", call("ij.Prefs.get", "global.showRoughValues",false));
}	
Dialog.addCheckbox("Show fine length measurements", call("ij.Prefs.get", "global.showFineValues",false));
Dialog.addMessage("ROI parameters");
Dialog.addCheckbox("Show user-defined/nucleus ROI measurements", call("ij.Prefs.get", "global.showReferenceRoiValues",false));
Dialog.addCheckbox("Show foci maximum intensities", call("ij.Prefs.get", "global.showMaximumValues", false));
Dialog.addCheckbox("Show foci particle intensities", call("ij.Prefs.get", "global.showParticleValues", false));
Dialog.addCheckbox("Show individual foci's values", call("ij.Prefs.get", "global.showIndividualFoci", false));
Dialog.addNumber("Display", parseInt(call("ij.Prefs.get", "global.maxRandomDistributionToShow",-1)), 0, 2, " random distribution results");

Dialog.show();
call("ij.Prefs.set", "global.showWarningMessages", Dialog.getCheckbox());
call("ij.Prefs.set", "global.debugMode",Dialog.getCheckbox());
call("ij.Prefs.set", "global.showAllThresholdMethods",Dialog.getCheckbox());
call("ij.Prefs.set", "global.showIntDenValues", Dialog.getCheckbox());
call("ij.Prefs.set", "global.showMeanValues", Dialog.getCheckbox());
if (call("ij.Prefs.get", "global.toolset","")=="meiosis") {
	call("ij.Prefs.set", "global.showRoughValues", Dialog.getCheckbox());
	call("ij.Prefs.set", "global.showFineValues", Dialog.getCheckbox());
}	
call("ij.Prefs.set", "global.showReferenceRoiValues",Dialog.getCheckbox());
call("ij.Prefs.set", "global.showMaximumValues",Dialog.getCheckbox());
call("ij.Prefs.set", "global.showParticleValues",Dialog.getCheckbox());
call("ij.Prefs.set", "global.showIndividualFoci",Dialog.getCheckbox());
call("ij.Prefs.set", "global.maxRandomDistributionToShow",Dialog.getNumber());

if (call("ij.Prefs.get", "global.showAllThresholdMethods",false)!=showAllThresholdMethodsAtStart){
	if (call("ij.Prefs.get", "global.showAllThresholdMethods",false)) {
		methods = getList("threshold.methods");
		tempROIs=newArray("nucleus", "axis", "synapsis", "foci");
		for(roi=0; roi<tempROIs.length; roi++) {
			tempText="global."+tempROIs[roi]+"ThresholdsNumber";
			call("ij.Prefs.set", tempText,methods.length);
			for(i=0; i<	methods.length; i++) {
				tempText="global."+tempROIs[roi]+"Threshold"+i;
				call("ij.Prefs.set", tempText, methods[i]);
			}	
		}
	}	
	else {
		defaultTempROIs=newArray("defaultNucleus","defaultAxis", "defaultSynapsis", "defaultFoci");
		tempROIs=newArray("nucleus","axis", "synapsis", "foci");
		for (tr=0; tr<tempROIs.length; tr++) {
			defaultTempText="global."+defaultTempROIs[tr]+"ThresholdsNumber";
			tempText="global."+tempROIs[tr]+"ThresholdsNumber";
			call("ij.Prefs.set", tempText,parseInt(call("ij.Prefs.get", defaultTempText, -1)));
			for(i=0; i<	parseInt(call("ij.Prefs.get", defaultTempText, -1)); i++) {
				defaultTempText="global."+tempROIs[tr]+"Threshold"+i;
				tempText="global."+tempROIs[tr]+"Threshold"+i;
				call("ij.Prefs.set", tempText, call("ij.Prefs.get",defaultTempText,""));
			}
		}
	}
}


</macro>
</line>
