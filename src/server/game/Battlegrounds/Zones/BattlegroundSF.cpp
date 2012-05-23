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

#include "Battleground.h"
#include "BattlegroundSF.h"
#include "Creature.h"
#include "GameObject.h"
#include "Language.h"
#include "Object.h"
#include "ObjectMgr.h"
#include "BattlegroundMgr.h"
#include "Player.h"
#include "World.h"
#include "WorldPacket.h"

// these variables aren't used outside of this file, so declare them only here
enum BG_SF_Rewards
{
    BG_SF_WIN = 0,
    BG_SF_MAP_COMPLETE,
    BG_SF_REWARD_NUM
};

uint32 BG_SF_Honor[BG_HONOR_MODE_NUM][BG_SF_REWARD_NUM] =
{
    {20, 40}, // normal honor
    {60, 40}  // holiday
};

BattlegroundSF::BattlegroundSF()
{
    BgObjects.resize(BG_SF_OBJECT_MAX);
    BgCreatures.resize(BG_CREATURES_MAX_SF);

    StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_SF_START_TWO_MINUTES;
    StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_SF_START_ONE_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_SF_START_HALF_MINUTE;
    StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_SF_HAS_BEGUN;
}

BattlegroundSF::~BattlegroundSF()
{
}

void BattlegroundSF::PostUpdateImpl(uint32 diff)
{
}

void BattlegroundSF::StartingEventCloseDoors()
{
    for (uint32 i = BG_SF_OBJECT_DOOR_A_1; i <= BG_SF_OBJECT_DOOR_H_4; ++i)
    {
        DoorClose(i);
        SpawnBGObject(i, RESPAWN_IMMEDIATELY);
    }

    UpdateWorldState(BG_SF_STATE_TIMER_ACTIVE, 1);
    UpdateWorldState(BG_SF_STATE_TIMER, 25);
}

void BattlegroundSF::StartingEventOpenDoors()
{
    for (uint32 i = BG_SF_OBJECT_DOOR_A_1; i <= BG_SF_OBJECT_DOOR_A_4; ++i)
        DoorOpen(i);
    for (uint32 i = BG_SF_OBJECT_DOOR_H_1; i <= BG_SF_OBJECT_DOOR_H_4; ++i)
        DoorOpen(i);

    SpawnBGObject(BG_SF_OBJECT_DOOR_A_3, RESPAWN_ONE_DAY);
    SpawnBGObject(BG_SF_OBJECT_DOOR_A_4, RESPAWN_ONE_DAY);
    SpawnBGObject(BG_SF_OBJECT_DOOR_H_3, RESPAWN_ONE_DAY);
    SpawnBGObject(BG_SF_OBJECT_DOOR_H_4, RESPAWN_ONE_DAY);

    // players joining later are not eligibles
    StartTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, SF_EVENT_START_BATTLE);
}

void BattlegroundSF::AddPlayer(Player* player)
{
    Battleground::AddPlayer(player);
    //create score and add it to map, default values are set in constructor
    BattlegroundSFScore* sc = new BattlegroundSFScore;

    PlayerScores[player->GetGUID()] = sc;
}

void BattlegroundSF::RemovePlayer(Player* player, uint64 guid, uint32 /*team*/)
{
}

void BattlegroundSF::UpdateTeamScore(uint32 team)
{
}

void BattlegroundSF::HandleAreaTrigger(Player* Source, uint32 Trigger)
{
    // this is wrong way to implement these things. On official it done by gameobject spell cast.
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
}

bool BattlegroundSF::SetupBattleground()
{
    if (// alliance gates
        !AddObject(BG_SF_OBJECT_DOOR_A_1, BG_OBJECT_DOOR_A_1_SF_ENTRY, 1503.335f, 1493.466f, 352.1888f, 3.115414f, 0, 0, 0.9999143f, 0.01308903f, RESPAWN_IMMEDIATELY)
        || !AddObject(BG_SF_OBJECT_DOOR_A_2, BG_OBJECT_DOOR_A_2_SF_ENTRY, 1492.478f, 1457.912f, 342.9689f, 3.115414f, 0, 0, 0.9999143f, 0.01308903f, RESPAWN_IMMEDIATELY)
        || !AddObject(BG_SF_OBJECT_DOOR_A_3, BG_OBJECT_DOOR_A_3_SF_ENTRY, 1468.503f, 1494.357f, 351.8618f, 3.115414f, 0, 0, 0.9999143f, 0.01308903f, RESPAWN_IMMEDIATELY)
        || !AddObject(BG_SF_OBJECT_DOOR_A_4, BG_OBJECT_DOOR_A_4_SF_ENTRY, 1471.555f, 1458.778f, 362.6332f, 3.115414f, 0, 0, 0.9999143f, 0.01308903f, RESPAWN_IMMEDIATELY)
        // horde gates
        || !AddObject(BG_SF_OBJECT_DOOR_H_1, BG_OBJECT_DOOR_H_1_SF_ENTRY, 949.1663f, 1423.772f, 345.6241f, -0.5756807f, -0.01673368f, -0.004956111f, -0.2839723f, 0.9586737f, RESPAWN_IMMEDIATELY)
        || !AddObject(BG_SF_OBJECT_DOOR_H_2, BG_OBJECT_DOOR_H_2_SF_ENTRY, 953.0507f, 1459.842f, 340.6526f, -1.99662f, -0.1971825f, 0.1575096f, -0.8239487f, 0.5073641f, RESPAWN_IMMEDIATELY)
        || !AddObject(BG_SF_OBJECT_DOOR_H_3, BG_OBJECT_DOOR_H_3_SF_ENTRY, 949.9523f, 1422.751f, 344.9273f, 0.0f, 0, 0, 0, 1, RESPAWN_IMMEDIATELY)
        || !AddObject(BG_SF_OBJECT_DOOR_H_4, BG_OBJECT_DOOR_H_4_SF_ENTRY, 950.7952f, 1459.583f, 342.1523f, 0.05235988f, 0, 0, 0.02617695f, 0.9996573f, RESPAWN_IMMEDIATELY)
)
    {
        sLog->outErrorDb("BatteGroundSF: Failed to spawn some object Battleground not created!");
        return false;
    }

    WorldSafeLocsEntry const* sg = sWorldSafeLocsStore.LookupEntry(SF_GRAVEYARD_MAIN_ALLIANCE);
    if (!sg || !AddSpiritGuide(SF_SPIRIT_MAIN_ALLIANCE, sg->x, sg->y, sg->z, 3.124139f, ALLIANCE))
    {
        sLog->outErrorDb("BatteGroundSF: Failed to spawn Alliance spirit guide! Battleground not created!");
        return false;
    }

    sg = sWorldSafeLocsStore.LookupEntry(SF_GRAVEYARD_MAIN_HORDE);
    if (!sg || !AddSpiritGuide(SF_SPIRIT_MAIN_HORDE, sg->x, sg->y, sg->z, 3.193953f, HORDE))
    {
        sLog->outErrorDb("BatteGroundSF: Failed to spawn Horde spirit guide! Battleground not created!");
        return false;
    }

    sLog->outDebug(LOG_FILTER_BATTLEGROUND, "BatteGroundWS: BG objects and spirit guides spawned");

    return true;
}

void BattlegroundSF::Reset()
{
    //call parent's class reset
    Battleground::Reset();

    m_TeamScores[BG_TEAM_ALLIANCE]      = 0;
    m_TeamScores[BG_TEAM_HORDE]         = 0;
    bool isBGWeekend = sBattlegroundMgr->IsBGWeekend(GetTypeID());
    m_ReputationCapture = (isBGWeekend) ? 45 : 35;
    m_HonorWinKills = (isBGWeekend) ? 3 : 1;
    m_HonorEndKills = (isBGWeekend) ? 4 : 2;
    // For WorldState
    _minutesElapsed                    = 0;
}

void BattlegroundSF::EndBattleground(uint32 winner)
{
    //win reward
    if (winner == ALLIANCE)
        RewardHonorToTeam(GetBonusHonorFromKill(m_HonorWinKills), ALLIANCE);
    if (winner == HORDE)
        RewardHonorToTeam(GetBonusHonorFromKill(m_HonorWinKills), HORDE);
    //complete map_end rewards (even if no team wins)
    RewardHonorToTeam(GetBonusHonorFromKill(m_HonorEndKills), ALLIANCE);
    RewardHonorToTeam(GetBonusHonorFromKill(m_HonorEndKills), HORDE);

    Battleground::EndBattleground(winner);
}

void BattlegroundSF::HandleKillPlayer(Player* player, Player* killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    EventPlayerDroppedFlag(player);

    Battleground::HandleKillPlayer(player, killer);
}

void BattlegroundSF::UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor)
{

    BattlegroundScoreMap::iterator itr = PlayerScores.find(Source->GetGUID());
    if (itr == PlayerScores.end())                         // player not found
        return;

    switch (type)
    {
        case SCORE_TOWERS_DESTROYED:
            ((BattlegroundSFScore*)itr->second)->TowersDestroyed += value;
            break;
        case SCORE_NPCS_KILLED:
            ((BattlegroundSFScore*)itr->second)->NpcsKilled += value;
            break;
		case SCORE_HEROS_KILLED:
            ((BattlegroundSFScore*)itr->second)->HerosKilled += value;
            break;
        case SCORE_CREDITS_EARNED:
            ((BattlegroundSFScore*)itr->second)->CreditsEarned += value;
            break;
		case SCORE_CREDITS_USED:
            ((BattlegroundSFScore*)itr->second)->CreditsUsed += value;
            break;
        default:
            Battleground::UpdatePlayerScore(Source, type, value, doAddHonor);
            break;
    }
}

void BattlegroundSF::FillInitialWorldStates(WorldPacket& data)
{

    if (GetStatus() == STATUS_IN_PROGRESS)
    {
        data << uint32(BG_SF_STATE_TIMER_ACTIVE) << uint32(1);
        data << uint32(BG_SF_STATE_TIMER) << uint32(25-_minutesElapsed);
    }
    else
        data << uint32(BG_SF_STATE_TIMER_ACTIVE) << uint32(0);
}

