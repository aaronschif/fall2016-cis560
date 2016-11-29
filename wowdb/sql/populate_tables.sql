insert into faction (id, name)
values (1, 'Alliance'),
       (2, 'Horde')
on conflict do nothing;

insert into race (id, name, racial_trait_1, racial_trait_2)
values (1, 'Human'),
       (2, 'Dwarf'),
       (3, 'Night Elf'),
       (4, 'Gnome'),
       (5, 'Draenei'),
       (6, 'Worgen'),
       (7, 'Orc'),
       (8, 'Undead', 'Will of the Foresaken', 'Cannibalize'),
       (9, 'Tauren', 'Brawn', 'War Stomp'),
       (10, 'Troll', 'berserking', 'Da Voodoo Shuffle'),
       (11, 'Blood Elf', 'Arcane Torrent', 'Arcane Affinity'),
       (12, 'Goblin', 'Rocket Jump', 'Rocket Barrage'),
       (13, 'Pandaren', 'Bouncy', 'Inner Peace')
on conflict do nothing;

insert into class (id, name)
values (1, 'Death Knight'),
       (2, 'Druid'),
       (3, 'Hunter'),
       (4, 'Mage'),
       (5, 'Monk'),
       (6, 'Paladin'),
       (7, 'Priest'),
       (8, 'Rogue'),
       (9, 'Shaman'),
       (10, 'Warlock'),
       (11, 'Warrior')
on conflict do nothing;

insert into specialization (id, class_name, specialization_name)
values (1, 'Death Knight', 'Blood'),
       (2, 'Death Knight', 'Frost'),
       (3, 'Death Knight', 'Unholy'),
       (4, 'Druid', 'Balance'),
       (5, 'Druid', 'Restoration'),
       (6, 'Druid', 'Guardian'),
       (7, 'Druid', 'Feral'),
       (8, 'Hunter', 'Beast Mastery'),
       (9, 'Hunter', 'Survival'),
       (10, 'Hunter', 'Marksmanship'),
       (11, 'Mage', 'Arcane'),
       (12, 'Mage', 'Fire'),
       (13, 'Mage', 'Frost'),
       (14, 'Monk', 'Brewmaster'),
       (15, 'Monk', 'Mistweaver'),
       (16, 'Monk', 'Windwalker'),
       (17, 'Paladin', 'Holy'),
       (18, 'Paladin', 'Retribution'),
       (19, 'Paladin', 'Protection')
on conflict do nothing;

/* Certain pieces of gear do not have a material type, such as back pieces and necklaces
   I used 'none' to represent these

   I put notes next to each insert value to note where they come from.
 */
insert into gear (id, name, slot, primary_stat, secondary_stat, material, tradable)
values (1, 'Rook Footman''s Warboots', 'Feet', '556 Strength', '243 Critical Strike', 'Plate', 'No'), /* Black Rook Hold, Amalgam of Souls */
       (2, 'Shadowfeather Shawl', 'Back', '417 Agility', '389 Haste', 'None', 'No'), /* Black Rook Hold, Amalgam of Souls */
       (3, 'Etheldrin''s Breastplate', 'Chest', '742 Strenth', '705 Mastery', 'Plate', 'No'), /* Black Rook Hold, Amalgam of Souls */
       (4, 'Ravencourt Formal Robes', 'Chest', '742 Intellect', '367 Critical Strike', 'Cloth', 'No'), /* Black Rook Hold, Amalgam of Souls */
       (5, 'Soulstarve Hood', 'Head', '742 Agility', '599 Haste', 'Leather', 'No'), /* Black Rook Hold, Illysanna Ravencrest */
       (6, 'Soul-Torn Fury Cinch', 'Waist', '556 Intellect', '259 Critical Strike', 'Mail', 'No'), /* Black Rook Hold, Illysanna Ravencrest */
       (7, 'Slippers of Heedless Sacrifice', 'Feet', '556 Intellect', '275 Haste', 'Cloth', 'No'), /* Black Rook Hold, Illysanna Ravencrest */
       (8, 'Leadfoot Earthshakers', 'Feet', '556 Strength', '227 Versatility', 'Plate', 'No'), /* Black Rook Hold, Smashspite the Hateful */
       (9, 'Shorn Batbrood Cuffs', 'Wrist', '417 Agility', '397 Critical Strike', 'Leather', 'No'), /* Black Rook Hold, Smashspite the Hateful */
       (10, 'Felbat Leather Vest', 'Chest', '742 Agility', '670 Critical Strike', 'Leather', 'No'), /* Black Rook Hold, Smashspite the Hateful */
       (11, 'Mardum Chain Vest', 'Chest', '742 Intellect', '388 Versatility', 'Mail', 'No'), /* Black Rook Hold, Smashspite the Hateful */

on conflict do nothing;

insert into "set" (set_id, name, set_bonus)
values ()
on conflict do nothing;

insert into location (id, map_region)
values (1, 'Highmountain'),
       (2, 'Azsuna'),
       (3, 'Suramar'),
       (4, 'Stormheim'),
       (5, 'Val''Sharah'),
       (6, 'The Broken Shore'),
       (7, 'Dalaran')
on conflict do nothing;

insert into dungeon (id, dungeon_name, boss)
values (1, 'Black Rook Hold', 'Amalgam of Souls'),
       (2, 'Black Rook Hold', 'Illysanna Ravencrest'),
       (3, 'Black Rook Hold', 'Smashspite the Hateful'),
       (4, 'Black Rook Hold', 'Lord Kur''talos Ravencrest'),
       (5, 'Court of Stars', 'Patrol Captain Gerdo'),
       (6, 'Court of Stars', 'Talixae Flamewreath'),
       (7, 'Court of Stars', 'Adisor Melandrus'),
       (8, 'Eye of Azshara', 'Serpentrix'),
       (9, 'Eye of Azshara', 'Warlord Parjesh'),
       (10, 'Eye of Azshara', 'Lady Hatecoil'),
       (11, 'Eye of Azshara', 'King Deepbeard'),
       (12, 'Eye of Azshara', 'Wrath of Azshara'),
       (13, 'Halls of Valor', 'Hymdall'),
       (14, 'Halls of Valor', 'Hyrja'),
       (15, 'Halls of Valor', 'Fenryr'),
       (16, 'Halls of Valor', 'God-King Skovald'),
       (17, 'Halls of Valor', 'Odyn'),
       (18, 'Dearkheart Thicket', 'Archdruid Glaidalis'),
       (19, 'Dearkheart Thicket', 'Oakheart'),
       (20, 'Dearkheart Thicket', 'Dresaron'),
       (21, 'Dearkheart Thicket', 'Shade of Xavius'),
       (22, 'Maw of Souls', 'Ymiron'),
       (23, 'Maw of Souls', 'Harbaron'),
       (24, 'Maw of Souls', 'Helya'),
       (25, 'Neltharion''s Lair', 'Rokmora'),
       (26, 'Neltharion''s Lair', 'Ularogg Cragshaper'),
       (27, 'Neltharion''s Lair', 'Naraxas'),
       (28, 'Neltharion''s Lair', 'Dargrul the Underking'),
       (29, 'The Arcway', 'Ivanyr'),
       (30, 'The Arcway', 'Corstilax'),
       (31, 'The Arcway', 'General Xakal'),
       (32, 'The Arcway', 'Nal''tira'),
       (33, 'The Arcway', 'Advisor Vandros'),
       (34, 'Vault of the Wardens', 'Tirathon Saltheril'),
       (35, 'Vault of the Wardens', 'Ash''golm'),
       (36, 'Vault of the Wardens', 'Glazer'),
       (37, 'Vault of the Wardens', 'Cordana Felsong'),
       (38, 'Vault of the Wardens', 'Inquisitor Tormentorum'),
       (39, 'Violet Hold', 'Erekem'),
       (40, 'Violet Hold', 'Moragg'),
       (41, 'Violet Hold', 'Ichoron'),
       (42, 'Violet Hold', 'Xevozz'),
       (43, 'Violet Hold', 'Lavanthor'),
       (44, 'Violet Hold', 'Zuramat the Obliterator'),
       (45, 'Violet Hold', 'Cyanigosa')
on conflict do nothing;

insert into raid (id, raid_name, boss)
values (1, 'Emerald Nightmare', 'Ursoc'),
       (2, 'Emerald Nightmare', 'Nythendra'),
       (3, 'Emerald Nightmare', 'Dragons of Nightmare'),
       (4, 'Emerald Nightmare', 'Xavius'),
       (5, 'Emerald Nightmare', 'I''lgynoth'),
       (6, 'Emerald Nightmare', 'Elerethe Renferal'),
       (7, 'Emerald Nightmare', 'Cenarius'),
       (8, 'Trial of Valor', 'Odyn'),
       (9, 'Trial of Valor', 'Guarm'),
       (20, 'Trial of Valor', 'Helya'),
       (11, 'The Nighthold', 'Skorpyron'),
       (12, 'The Nighthold', 'Chronomatic Anomaly'),
       (13, 'The Nighthold', 'Trilliax'),
       (14, 'The Nighthold', 'Spellblade Aluriel'),
       (16, 'The Nighthold', 'High Botanist Tel''am'),
       (17, 'The Nighthold', 'Star Augur Etraeus')
       (18, 'The Nighthold', 'Tichondrius'),
       (19, 'The Nighthold', 'Krosus'),
       (20, 'The Nighthold', 'Grand Magistrix Elisande'),
       (21, 'The Nighthold', 'Gul''dan')
on conflict do nothing;

insert into vendor (id, first_name, surname, price)
values (1, 'casey', 'poole', '2')
on conflict do nothing;