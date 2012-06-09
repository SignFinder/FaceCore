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

#ifndef TRINITYCORE_TEMPSUMMON_H
#define TRINITYCORE_TEMPSUMMON_H

#include "Creature.h"

class TempSummon : public Creature
{
    public:
        explicit TempSummon(SummonPropertiesEntry const* properties, Unit* owner, bool isWorldObject);
        virtual ~TempSummon() {}
        void Update(uint32 time);
        virtual void InitStats(uint32 lifetime);
        virtual void InitSummon();
        void UnSummon(uint32 msTime = 0);
        void RemoveFromWorld();
        void SetTempSummonType(TempSummonType type);
        void SaveToDB(uint32 /*mapid*/, uint8 /*spawnMask*/, uint32 /*phaseMask*/) {}
        Unit* GetSummoner() const;
        uint64 GetSummonerGUID() { return m_summonerGUID; }
        TempSummonType const& GetSummonType() { return m_type; }
        uint32 GetTimer() { return m_timer; }

        const SummonPropertiesEntry* const m_Properties;
    private:
        TempSummonType m_type;
        uint32 m_timer;
        uint32 m_lifetime;
        uint64 m_summonerGUID;
};

class Minion : public TempSummon
{
    public:
        Minion(SummonPropertiesEntry const* properties, Unit* owner, bool isWorldObject);
        void InitStats(uint32 duration);
        void RemoveFromWorld();
        Unit* GetOwner() { return m_owner; }
        float GetFollowAngle() const { return m_followAngle; }
        void SetFollowAngle(float angle) { m_followAngle = angle; }
        bool IsPetGhoul() const {return GetEntry() == 26125;} // Ghoul may be guardian or pet
        bool IsGuardianPet() const;
    protected:
        Unit* const m_owner;
        float m_followAngle;
};

enum ScalingTarget
{
    SCALING_TARGET_ALL          = 0,
    SCALING_TARGET_STAT,
    SCALING_TARGET_RESISTANCE,
    SCALING_TARGET_ATTACKPOWER,
    SCALING_TARGET_DAMAGE,
    SCALING_TARGET_SPELLDAMAGE,
    SCALING_TARGET_HIT,
    SCALING_TARGET_SPELLHIT,
    SCALING_TARGET_EXPERTIZE,
    SCALING_TARGET_POWERREGEN,
    SCALING_TARGET_ATTACKSPEED,
    SCALING_TARGET_MAX
};

struct ScalingAction
{
    explicit ScalingAction(ScalingTarget _target, uint32 _stat, bool _apply ) :
                                         target(_target), stat(_stat), apply(_apply)
    {}
    ScalingTarget target;
    uint32      stat;
    bool        apply;
};

struct PetScalingData;

class Guardian : public Minion
{
    public:
        Guardian(SummonPropertiesEntry const* properties, Unit* owner, bool isWorldObject);
        virtual ~Guardian();
        void Update(uint32 time);
        void InitStats(uint32 duration);
        bool InitStatsForLevel(uint8 level);
        void InitSummon();

        bool UpdateStats(Stats stat);
        bool UpdateAllStats();
        void UpdateResistances(uint32 school);
        void UpdateArmor();
        void UpdateMaxHealth();
        void UpdateMaxPower(Powers power);
        void UpdateAttackPowerAndDamage(bool ranged = false);
        void UpdateDamagePhysical(WeaponAttackType attType);
        void UpdateSpellPower();
        void UpdateManaRegen();

        void RegenerateHealth(uint32 diff);
        float OCTRegenHPPerSpirit();
        float OCTRegenMPPerSpirit();
        void ApplyScalingBonus(ScalingAction* action);
        void ApplyAllScalingBonuses(bool apply);
        void ApplyStatScalingBonus(Stats stat, bool apply);
        void ApplyResistanceScalingBonus(uint8 school, bool apply);
        void ApplyAttackPowerScalingBonus(bool apply);
        void ApplyDamageScalingBonus(bool apply);
        void ApplySpellDamageScalingBonus(bool apply);
        void ApplyHitScalingBonus(bool apply);
        void ApplySpellHitScalingBonus(bool apply);
        void ApplyExpertizeScalingBonus(bool apply);
        void ApplyPowerregenScalingBonus(bool apply);
        void ApplyAttackSpeedScalingBonus(bool apply);
        PetScalingData* CalculateScalingData( bool recalculate = false );
        void AddScalingAction(ScalingTarget target, uint32 stat, bool apply);

        void CastPetPassiveAuras(bool current);

    protected:
        PetScalingData*  m_PetScalingData;
        PetScalingData*  m_baseBonusData;
        std::queue<ScalingAction> m_scalingQueue;
};

class Puppet : public Minion
{
    public:
        Puppet(SummonPropertiesEntry const* properties, Unit* owner);
        void InitStats(uint32 duration);
        void InitSummon();
        void Update(uint32 time);
        void RemoveFromWorld();
    protected:
        Player* m_owner;
};

class ForcedUnsummonDelayEvent : public BasicEvent
{
public:
    ForcedUnsummonDelayEvent(TempSummon& owner) : BasicEvent(), m_owner(owner) { }
    bool Execute(uint64 e_time, uint32 p_time);

private:
    TempSummon& m_owner;
};
#endif
