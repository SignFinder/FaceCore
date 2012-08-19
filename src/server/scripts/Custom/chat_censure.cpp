#include "ScriptPCH.h"
#include "Channel.h"
 
class System_Censure : public PlayerScript
{
public:
        System_Censure() : PlayerScript("System_Censure") {}
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg)
        {
                CheckMessage(player, msg, lang, NULL, NULL, NULL, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Player* receiver)
        {
                CheckMessage(player, msg, lang, receiver, NULL, NULL, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Group* group)
        {
                CheckMessage(player, msg, lang, NULL, group, NULL, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Guild* guild)
        {
                CheckMessage(player, msg, lang, NULL, NULL, guild, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Channel* channel)
        {
                CheckMessage(player, msg, lang, NULL, NULL, NULL, channel);
        }
 
void CheckMessage(Player* player, std::string& msg, uint32 lang, Player* /*receiver*/, Group* /*group*/, Guild* /*guild*/, Channel* channel)
{
    //if (player->isGameMaster() || lang == LANG_ADDON)
            //return;
 
    // transform to lowercase (for simpler checking)
    std::string lower = msg;
    std::transform(lower.begin(), lower.end(), lower.begin(), ::tolower);
 
    std::string checks[8];
    checks[0] ="http://";
    checks[1] =".com";
    checks[2] =".net";
    checks[3] =".org";
    checks[4] =".ru";
    checks[5] ="rondor";
    checks[6] ="www.";
    checks[7] =".biz";
    for (int i = 0; i < 8; ++i)
        if (lower.find(checks[i]) != std::string::npos)
        {
            msg = "";
            ChatHandler(player).PSendSysMessage("Реклама запрещена ты попался голубчик теперь мы тебя забаним");         
            return;
        }
} 
};
 
void AddSC_System_Censure()
{
    new System_Censure();
}