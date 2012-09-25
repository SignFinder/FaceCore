# Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
  Custom/npc_title.cpp
  Custom/npc_transmogrify.cpp
  Custom/hunterpet_vendor.cpp
  Custom/npc_mount.cpp 
  Custom/argent_tournament.cpp
  Custom/dalaran_squirrel.cpp
  Custom/chat_censure.cpp
  Custom/npc_arena_teamTop.cpp
  Custom/duel_reset.cpp
  Custom/arena_spectator.cpp
)

message("  -> Prepared: Custom")
