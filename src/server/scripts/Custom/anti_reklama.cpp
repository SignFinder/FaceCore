/*
 * Copyright (C) 2012 SliceCore <https://github.com/Vitasic/BattleCore/>
 */

#include "ScriptPCH.h"
#include "Config.h"
#include "Player.h"
#include "AccountMgr.h"
#include "Channel.h"
#include "Config.h"

class anti_rerlama : public PlayerScript
{
    public:
       anti_rerlama() : PlayerScript("anti_rerlama") { }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg)
        {
            CheckReclameWords(player, msg, lang, NULL, NULL, NULL, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Player* receiver)
        {
            CheckReclameWords(player, msg, lang, receiver, NULL, NULL, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Group* group)
        {
            CheckReclameWords(player, msg, lang, NULL, group, NULL, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Guild* guild)
        {
             CheckReclameWords(player, msg, lang, NULL, NULL, guild, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Channel* channel)
        {
            CheckReclameWords(player, msg, lang, NULL, NULL, NULL, channel);
        }
 
        void CheckReclameWords(Player* player, std::string& msg, uint32 lang, Player* /*receiver*/, Group* /*group*/, Guild* /*guild*/, Channel* channel)
        {
            if (sWorld->getBoolConfig(CONFIG_ANTI_REKLAMA_ENABLE))
            {
                if (player->isGameMaster() || lang == LANG_ADDON)
                    return;

                std::string lower = msg;
                std::transform(lower.begin(), lower.end(), lower.begin(), ::tolower);

                std::string checkwords[41];
                checkwords[0] ="http";
                checkwords[1] ="com";
                checkwords[2] ="net";
                checkwords[3] ="org";
                checkwords[4] ="ru";
                checkwords[5] ="no-ip";
                checkwords[6] ="www";
                checkwords[7] ="biz";
                checkwords[8] ="su";
                checkwords[9] ="ck";
                checkwords[10] ="ua";
                checkwords[11] ="ws";
                checkwords[12] =".info";
                checkwords[13] =".lt";
                checkwords[14] =".zapto";
                checkwords[15] ="-wow";
                checkwords[16] ="wow-";
                checkwords[17] ="wowcircle";
                checkwords[18] ="wowcircle";
                checkwords[19] ="uwow";
                checkwords[20] ="isengard";
                checkwords[21] ="swow";
                checkwords[22] ="aldoran";
                checkwords[23] ="wow-cool";
                checkwords[24] ="elite";
                checkwords[25] ="magic";
                checkwords[26] ="mig";
                checkwords[27] ="sirus";
                checkwords[28] ="cln";
                checkwords[29] ="elgracia";
                checkwords[30] ="uawow";
                checkwords[31] ="turbowow";
                checkwords[32] ="spzone";
                checkwords[33] ="fakewow";
                checkwords[34] ="backkor";
                checkwords[35] ="letswow";
                checkwords[36] ="izbooshka";
                checkwords[37] ="deathside";
                checkwords[38] ="warsong";
                checkwords[39] ="RiverRise";
                checkwords[40] ="rondor";
                checkwords[41] ="RiverRise";
         
            for (int i = 0; i < 69; ++i)
                if (lower.find(checkwords[i]) != std::string::npos)
                {
                    msg = "";
                    ChatHandler(player).PSendSysMessage("|cffff0000Реклама запрещена!|r");                
                    return;
                }
            }
        }
};

void AddSC_reklama()
{
  new anti_rerlama;
}