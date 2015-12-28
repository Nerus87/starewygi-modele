#pragma semicolon 1

#include <sourcemod>
#include <sdktools>

/* modele gdy nie ustawiono dla mapy (w csgo domyslnie to SEAL TEAM 6 i Phoenix) */
new String:modelCt1[256] = "models/dtrain/ct_gign.mdl";
new String:modelCt2[256] = "models/dtrain/ct_gsg9.mdl";
new String:modelCt3[256] = "models/dtrain/ct_sas.mdl";
new String:modelCt4[256] = "models/dtrain/ct_urban.mdl";
new String:modelTt1[256] = "models/casslt/t_arctic.mdl";
new String:modelTt2[256] = "models/casslt/t_guerilla.mdl";
new String:modelTt3[256] = "models/casslt/t_leet.mdl";
new String:modelTt4[256] = "models/casslt/t_phoenix.mdl";


static String:ModelFile[256];
static bool:ModelSet[65];

public Plugin:myinfo = {
	name = "Stare-Wygi.pl - Modele",
	author = "Xseba360",
	version = "1.1"
}

public OnPluginStart() {
	HookEvent("player_spawn", Event_PlayerSpawn, EventHookMode_Post);
}

public OnMapStart() {
	new String:currentMap[64];
	GetCurrentMap(currentMap, sizeof(currentMap));


	/* Tu Dodajemy Modele */
	if (StrEqual(currentMap,"de_dust2_csgo")) {
		modelCt1 = "models/ddust2/ct_gign.mdl";
		modelCt2 = "models/ddust2/ct_gsg9.mdl";
		modelCt3 = "models/ddust2/ct_sas.mdl";
		modelCt4 = "models/ddust2/ct_urban.mdl";
		modelTt1 = "models/ddust2/t_arctic.mdl";
		modelTt2 = "models/ddust2/t_guerilla.mdl";
		modelTt3 = "models/ddust2/t_leet.mdl";
		modelTt4 = "models/ddust2/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_train_csgo")) {

		modelCt1 = "models/dtrain/ct_gign.mdl";
		modelCt2 = "models/dtrain/ct_gsg9.mdl";
		modelCt3 = "models/dtrain/ct_sas.mdl";
		modelCt4 = "models/dtrain/ct_urban.mdl";
		modelTt1 = "models/dtrain/t_arctic.mdl";
		modelTt2 = "models/dtrain/t_guerilla.mdl";
		modelTt3 = "models/dtrain/t_leet.mdl";
		modelTt4 = "models/dtrain/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_lake_go4css_beta1")) {

		modelCt1 = "models/dtrain/ct_gign.mdl";
		modelCt2 = "models/dtrain/ct_gsg9.mdl";
		modelCt3 = "models/dtrain/ct_sas.mdl";
		modelCt4 = "models/dtrain/ct_urban.mdl";
		modelTt1 = "models/casslt/t_arctic.mdl";
		modelTt2 = "models/casslt/t_guerilla.mdl";
		modelTt3 = "models/casslt/t_leet.mdl";
		modelTt4 = "models/casslt/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"cs_assault_csgo")) {

		modelCt1 = "models/casslt/ct_gign.mdl";
		modelCt2 = "models/casslt/ct_gsg9.mdl";
		modelCt3 = "models/casslt/ct_sas.mdl";
		modelCt4 = "models/casslt/ct_urban.mdl";
		modelTt1 = "models/casslt/t_arctic.mdl";
		modelTt2 = "models/casslt/t_guerilla.mdl";
		modelTt3 = "models/casslt/t_leet.mdl";
		modelTt4 = "models/casslt/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"cs_italy_csgo")) {

		modelCt1 = "models/citaly/ct_gign.mdl";
		modelCt2 = "models/citaly/ct_gsg9.mdl";
		modelCt3 = "models/citaly/ct_sas.mdl";
		modelCt4 = "models/citaly/ct_urban.mdl";
		modelTt1 = "models/citaly/t_arctic.mdl";
		modelTt2 = "models/citaly/t_guerilla.mdl";
		modelTt3 = "models/citaly/t_leet.mdl";
		modelTt4 = "models/citaly/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_aztec_csgo")) {

		modelCt1 = "models/dtrain/ct_gign.mdl";
		modelCt2 = "models/dtrain/ct_gsg9.mdl";
		modelCt3 = "models/dtrain/ct_sas.mdl";
		modelCt4 = "models/dtrain/ct_urban.mdl";
		modelTt1 = "models/casslt/t_arctic.mdl";
		modelTt2 = "models/casslt/t_guerilla.mdl";
		modelTt3 = "models/casslt/t_leet.mdl";
		modelTt4 = "models/casslt/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_cbble_csgo")) {

		modelCt1 = "models/citaly/ct_gign.mdl";
		modelCt2 = "models/citaly/ct_gsg9.mdl";
		modelCt3 = "models/citaly/ct_sas.mdl";
		modelCt4 = "models/citaly/ct_urban.mdl";
		modelTt1 = "models/casslt/t_arctic.mdl";
		modelTt2 = "models/casslt/t_guerilla.mdl";
		modelTt3 = "models/casslt/t_leet.mdl";
		modelTt4 = "models/casslt/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_inferno_csgo")) {

		modelCt1 = "models/dinfrn/ct_gign.mdl";
		modelCt2 = "models/dinfrn/ct_gsg9.mdl";
		modelCt3 = "models/dinfrn/ct_sas.mdl";
		modelCt4 = "models/dinfrn/ct_urban.mdl";
		modelTt1 = "models/citaly/t_arctic.mdl";
		modelTt2 = "models/citaly/t_guerilla.mdl";
		modelTt3 = "models/citaly/t_leet.mdl";
		modelTt4 = "models/citaly/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_dust_csgo")) {
		modelCt1 = "models/ddust2/ct_gign.mdl";
		modelCt2 = "models/ddust2/ct_gsg9.mdl";
		modelCt3 = "models/ddust2/ct_sas.mdl";
		modelCt4 = "models/ddust2/ct_urban.mdl";
		modelTt1 = "models/ddust2/t_arctic.mdl";
		modelTt2 = "models/ddust2/t_guerilla.mdl";
		modelTt3 = "models/ddust2/t_leet.mdl";
		modelTt4 = "models/ddust2/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_mirage_csgo")) {
		modelCt1 = "models/dinfrn/ct_gign.mdl";
		modelCt2 = "models/dinfrn/ct_gsg9.mdl";
		modelCt3 = "models/dinfrn/ct_sas.mdl";
		modelCt4 = "models/dinfrn/ct_urban.mdl";
		modelTt1 = "models/ddust2/t_arctic.mdl";
		modelTt2 = "models/ddust2/t_guerilla.mdl";
		modelTt3 = "models/ddust2/t_leet.mdl";
		modelTt4 = "models/ddust2/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_nuke_csgo")) {
		modelCt1 = "models/dinfrn/ct_gign.mdl";
		modelCt2 = "models/dinfrn/ct_gsg9.mdl";
		modelCt3 = "models/dinfrn/ct_sas.mdl";
		modelCt4 = "models/dinfrn/ct_urban.mdl";
		modelTt1 = "models/dtrain/t_arctic.mdl";
		modelTt2 = "models/dtrain/t_guerilla.mdl";
		modelTt3 = "models/dtrain/t_leet.mdl";
		modelTt4 = "models/dtrain/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"cs_office_csgo")) {
		modelCt1 = "models/casslt/ct_gign.mdl";
		modelCt2 = "models/casslt/ct_gsg9.mdl";
		modelCt3 = "models/casslt/ct_sas.mdl";
		modelCt4 = "models/casslt/ct_urban.mdl";
		modelTt1 = "models/coffic/t_arctic.mdl";
		modelTt2 = "models/coffic/t_guerilla.mdl";
		modelTt3 = "models/coffic/t_leet.mdl";
		modelTt4 = "models/coffic/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_overpass_csgo")) {
		modelCt1 = "models/dovrps/ct_gign.mdl";
		modelCt2 = "models/dovrps/ct_gsg9.mdl";
		modelCt3 = "models/dovrps/ct_sas.mdl";
		modelCt4 = "models/dovrps/ct_urban.mdl";
		modelTt1 = "models/casslt/t_arctic.mdl";
		modelTt2 = "models/casslt/t_guerilla.mdl";
		modelTt3 = "models/casslt/t_leet.mdl";
		modelTt4 = "models/casslt/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"uac_heat2")) {
		modelCt1 = "models/ddust2/ct_gign.mdl";
		modelCt2 = "models/ddust2/ct_gsg9.mdl";
		modelCt3 = "models/ddust2/ct_sas.mdl";
		modelCt4 = "models/ddust2/ct_urban.mdl";
		modelTt1 = "models/ddust2/t_arctic.mdl";
		modelTt2 = "models/ddust2/t_guerilla.mdl";
		modelTt3 = "models/ddust2/t_leet.mdl";
		modelTt4 = "models/ddust2/t_phoenix.mdl";

	} else if (StrEqual(currentMap,"de_cache_csgo")) {

		modelCt1 = "models/citaly/ct_gign.mdl";
		modelCt2 = "models/citaly/ct_gsg9.mdl";
		modelCt3 = "models/citaly/ct_sas.mdl";
		modelCt4 = "models/citaly/ct_urban.mdl";
		modelTt1 = "models/casslt/t_arctic.mdl";
		modelTt2 = "models/casslt/t_guerilla.mdl";
		modelTt3 = "models/casslt/t_leet.mdl";
		modelTt4 = "models/casslt/t_phoenix.mdl";

	} else {
		modelCt1 = "models/dtrain/ct_gign.mdl";
		modelCt2 = "models/dtrain/ct_gsg9.mdl";
		modelCt3 = "models/dtrain/ct_sas.mdl";
		modelCt4 = "models/dtrain/ct_urban.mdl";
		modelTt1 = "models/casslt/t_arctic.mdl";
		modelTt2 = "models/casslt/t_guerilla.mdl";
		modelTt3 = "models/casslt/t_leet.mdl";
		modelTt4 = "models/casslt/t_phoenix.mdl";		
		PrintToServer("[SM] Brak ustawionych modeli dla mapy -- uzywanie domyslnych");
	}

	PrecacheModel("models/player.mdl",true);
	PrecacheModel(modelCt1,true);
	PrecacheModel(modelCt2,true);
	PrecacheModel(modelCt3,true);
	PrecacheModel(modelCt4,true);
	PrecacheModel(modelTt1,true);
	PrecacheModel(modelTt2,true);
	PrecacheModel(modelTt3,true);
	PrecacheModel(modelTt4,true);
}

public OnClientPutInServer(Client) {
	ModelFile = "models/player.mdl";
	ModelSet[Client] = false;
}

public Action:SetModel(Client) {
	if(Client == 0){
		return Plugin_Handled;
	}

	if(!IsPlayerAlive(Client)){
		return Plugin_Handled;
	}

	if(GetClientTeam(Client)==1) {
		return Plugin_Handled;
	}

	if(GetClientTeam(Client)==2) {
		new randomModelTt = GetRandomInt(1,4);
		if(randomModelTt == 1) {
			ModelFile = modelTt1;
		} else if(randomModelTt == 2) {
			ModelFile = modelTt2;
		} else if(randomModelTt == 3) {
			ModelFile = modelTt3;
		} else if(randomModelTt == 4) {
			ModelFile = modelTt4;
		} else {
			return Plugin_Handled;
		}
	}
	
	if(GetClientTeam(Client)==3) {
		new randomModelCt = GetRandomInt(1,4);
		if(randomModelCt == 1) {
			ModelFile = modelCt1;
		} else if(randomModelCt == 2) {
			ModelFile = modelCt2;
		} else if(randomModelCt == 3) {
			ModelFile = modelCt3;
		} else if(randomModelCt == 4) {
			ModelFile = modelCt4;
		} else {
			return Plugin_Handled;
		}
	}

	// Set the model
	SetEntityModel(Client, ModelFile);
	SetEntityRenderColor(Client, 255, 255, 255, 255);

	ModelSet[Client] = true;
	return Plugin_Handled;
}

public Event_PlayerSpawn(Handle:event, const String:name[], bool:dontBroadcast){
	/* test */
	decl Client;
	Client = GetClientOfUserId(GetEventInt(event, "userid"));
	SetModel(Client);
}