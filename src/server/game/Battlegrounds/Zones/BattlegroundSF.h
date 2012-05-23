/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __BATTLEGROUNDSF_H
#define __BATTLEGROUNDSF_H

#include "Battleground.h"

enum BG_SF_TimerOrScore
{
    BG_SF_MAX_TEAM_SCORE    = 3,
    BG_SF_SPELL_FORCE_TIME  = 600000,
    BG_SF_SPELL_BRUTAL_TIME = 900000
};

enum BG_SF_Sound
{
};

enum BG_SF_SpellId
{
    BG_SF_SPELL_FOCUSED_ASSAULT         = 46392,
    BG_SF_SPELL_BRUTAL_ASSAULT          = 46393
};

enum BG_SF_WorldStates
{
    BG_SF_ALLIANCE                = 1545,
    BG_SF_HORDE                   = 1546,
    BG_SF_STATE_TIMER             = 4248,
    BG_SF_STATE_TIMER_ACTIVE      = 4247
};

enum BG_SF_ObjectTypes
{
    BG_SF_OBJECT_DOOR_A_1       = 0,
    BG_SF_OBJECT_DOOR_A_2       = 1,
    BG_SF_OBJECT_DOOR_A_3       = 2,
    BG_SF_OBJECT_DOOR_A_4       = 3,
    BG_SF_OBJECT_DOOR_H_1       = 6,
    BG_SF_OBJECT_DOOR_H_2       = 7,
    BG_SF_OBJECT_DOOR_H_3       = 8,
    BG_SF_OBJECT_DOOR_H_4       = 9,
    BG_SF_OBJECT_MAX            = 18
};

enum BG_SF_ObjectEntry
{
    BG_OBJECT_DOOR_A_1_SF_ENTRY          = 179918,
    BG_OBJECT_DOOR_A_2_SF_ENTRY          = 179919,
    BG_OBJECT_DOOR_A_3_SF_ENTRY          = 179920,
    BG_OBJECT_DOOR_A_4_SF_ENTRY          = 179921,
    BG_OBJECT_DOOR_H_1_SF_ENTRY          = 179916,
    BG_OBJECT_DOOR_H_2_SF_ENTRY          = 179917,
    BG_OBJECT_DOOR_H_3_SF_ENTRY          = 180322,
    BG_OBJECT_DOOR_H_4_SF_ENTRY          = 180322,
};

enum BG_SF_TowerState
{
    BG_SF_TOWER_STATE_100          = 0,
    BG_SF_TOWER_STATE_80           = 1,
    BG_SF_TOWER_STATE_50           = 2,
    BG_SF_TOWER_STATE_20           = 3,
	BG_SF_TOWER_STATE_0            = 4
};

enum BG_SF_Graveyards
{
    SF_GRAVEYARD_MAIN_ALLIANCE     = 771,
    SF_GRAVEYARD_MAIN_HORDE        = 772
};

enum BG_SF_CreatureTypes
{
    SF_SPIRIT_MAIN_ALLIANCE   = 0,
    SF_SPIRIT_MAIN_HORDE      = 1,
	SF_NPC_ALLIANCE           = 2,
    SF_NPC_HORDE              = 3,

    BG_CREATURES_MAX_SF       = 4
};

enum BG_SF_CarrierDebuffs
{
    SF_SPELL_FOCUSED_ASSAULT   = 46392,
    SF_SPELL_BRUTAL_ASSAULT    = 46393
};

enum BG_SF_Objectives
{
    SF_OBJECTIVE_CAPTURE_FLAG   = 42,
    SF_OBJECTIVE_RETURN_FLAG    = 44
};

#define SF_EVENT_START_BATTLE   8563

class BattlegroundSFScore : public BattlegroundScore
{
    public:
        BattlegroundSFScore() : TowersDestroyed(0), NpcsKilled(0), HerosKilled(0), CreditsEarned(0), CreditsUsed(0) {};
        virtual ~BattlegroundSFScore() {};
        uint32 TowersDestroyed;
		uint32 NpcsKilled;
		uint32 HerosKilled;
		uint32 CreditsEarned;
		uint32 CreditsUsed;
};

class BattlegroundSF : public Battleground
{
    public:
        /* Construction */
        BattlegroundSF();
        ~BattlegroundSF();

        /* inherited from BattlegroundClass */
        virtual void AddPlayer(Player* player);
        virtual void StartingEventCloseDoors();
        virtual void StartingEventOpenDoors();

        /* Battleground Events */
        void RemovePlayer(Player* player, uint64 guid, uint32 team);
        void HandleAreaTrigger(Player* Source, uint32 Trigger);
        void HandleKillPlayer(Player* player, Player* killer);
        bool SetupBattleground();
        virtual void Reset();
        void EndBattleground(uint32 winner);

        void UpdateTeamScore(uint32 team);
        void UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor = true);
        virtual void FillInitialWorldStates(WorldPacket& data);

        /* Scorekeeping */
        uint32 GetTeamScore(uint32 TeamID) const            { return m_TeamScores[GetTeamIndexByTeamId(TeamID)]; }
        void AddPoint(uint32 TeamID, uint32 Points = 1)     { m_TeamScores[GetTeamIndexByTeamId(TeamID)] += Points; }
        void SetTeamPoint(uint32 TeamID, uint32 Points = 0) { m_TeamScores[GetTeamIndexByTeamId(TeamID)] = Points; }
        void RemovePoint(uint32 TeamID, uint32 Points = 1)  { m_TeamScores[GetTeamIndexByTeamId(TeamID)] -= Points; }
    private:

        uint32 m_ReputationCapture;
        uint32 m_HonorWinKills;
        uint32 m_HonorEndKills;
        uint8 _minutesElapsed;

        virtual void PostUpdateImpl(uint32 diff);
};
#endif

