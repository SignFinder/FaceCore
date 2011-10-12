/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
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

#include "Common.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Log.h"
#include "Opcodes.h"
#include "UpdateData.h"
#include "Player.h"

void WorldSession::HandleDuelAcceptedOpcode(WorldPacket& recvPacket)
{
    uint64 guid;
    Player* pl;
    Player* plTarget;

    recvPacket >> guid;

    if (!GetPlayer()->duel)                                  // ignore accept from duel-sender
        return;

    pl       = GetPlayer();
    plTarget = pl->duel->opponent;

    if (pl == pl->duel->initiator || !plTarget || pl == plTarget || pl->duel->startTime != 0 || plTarget->duel->startTime != 0)
        return;

    //sLog->outDebug(LOG_FILTER_PACKETIO, "WORLD: Received CMSG_DUEL_ACCEPTED");
    sLog->outStaticDebug("Player 1 is: %u (%s)", pl->GetGUIDLow(), pl->GetName());
    sLog->outStaticDebug("Player 2 is: %u (%s)", plTarget->GetGUIDLow(), plTarget->GetName());

    time_t now = time(NULL);
    pl->duel->startTimer = now;
    plTarget->duel->startTimer = now;

    // reset cooldowns and HP/Mana
    if (pl->GetAreaId() == 12 || pl->GetAreaId() == 14)
    {
        pl->SetHealth(pl->GetMaxHealth());
        plTarget->SetHealth(plTarget->GetMaxHealth());
        pl->RemoveArenaSpellCooldowns();
        plTarget->RemoveArenaSpellCooldowns();
        pl->RemoveAurasDueToSpell(25771);
        plTarget->RemoveAurasDueToSpell(25771);
        if (pl->getPowerType() == POWER_MANA) pl->SetPower(POWER_MANA, pl->GetMaxPower(POWER_MANA));
        if (plTarget->getPowerType() == POWER_MANA) plTarget->SetPower(POWER_MANA, plTarget->GetMaxPower(POWER_MANA));
	}
    if (pl->getPowerType() == POWER_RAGE) pl->SetPower(POWER_RAGE, 0);
    if (plTarget->getPowerType() == POWER_RAGE) plTarget->SetPower(POWER_RAGE, 0);
    if (pl->getPowerType() == POWER_RUNIC_POWER) pl->SetPower(POWER_RUNIC_POWER, 0);
    if (plTarget->getPowerType() == POWER_RUNIC_POWER) plTarget->SetPower(POWER_RUNIC_POWER, 0);

    pl->SendDuelCountdown(3000);
    plTarget->SendDuelCountdown(3000);
}

void WorldSession::HandleDuelCancelledOpcode(WorldPacket& recvPacket)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Received CMSG_DUEL_CANCELLED");
    uint64 guid;
    recvPacket >> guid;

    // no duel requested
    if (!GetPlayer()->duel)
        return;

    // player surrendered in a duel using /forfeit
    if (GetPlayer()->duel->startTime != 0)
    {
        GetPlayer()->CombatStopWithPets(true);
        if (GetPlayer()->duel->opponent)
            GetPlayer()->duel->opponent->CombatStopWithPets(true);

        GetPlayer()->CastSpell(GetPlayer(), 7267, true);    // beg
        GetPlayer()->DuelComplete(DUEL_WON);
        return;
    }

    GetPlayer()->DuelComplete(DUEL_INTERRUPTED);
}
