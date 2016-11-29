insert into faction (id, name)
values (1, 'Alliance'),
       (2, 'Horde')
on conflict do nothing;

insert into race (id, name, racial_trait_1, racial_trait_2)
values (1, 'Human', '1', '1'),
       (2, 'Dwarf', '1', '1'),
       (3, 'Night Elf', '1', '1'),
       (4, 'Gnome', '1', '1'),
       (5, 'Draenei', '1', '1'),
       (6, 'Worgen', '1', '1'),
       (7, 'Orc', '1', '1'),
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
insert into gear (id, name, slot, primary_stat, secondary_stat_1, secondary_stat_2, material, tradable)
values (1, 'Rook Footman''s Warboots', 'Feet', '556 Strength', '243 Critical Strike', '1', 'Plate', 'No'), /* Black Rook Hold, Amalgam of Souls */
       (2, 'Shadowfeather Shawl', 'Back', '417 Agility', '389 Haste', '1', 'None', 'No'), /* Black Rook Hold, Amalgam of Souls */
       (3, 'Etheldrin''s Breastplate', 'Chest', '742 Strenth', '705 Mastery', '1', 'Plate', 'No'), /* Black Rook Hold, Amalgam of Souls */
       (4, 'Ravencourt Formal Robes', 'Chest', '742 Intellect', '367 Critical Strike', '1', 'Cloth', 'No'), /* Black Rook Hold, Amalgam of Souls */
       (5, 'Soulstarve Hood', 'Head', '742 Agility', '599 Haste', '1', 'Leather', 'No'), /* Black Rook Hold, Illysanna Ravencrest */
       (6, 'Soul-Torn Fury Cinch', 'Waist', '556 Intellect', '259 Critical Strike', '1', 'Mail', 'No'), /* Black Rook Hold, Illysanna Ravencrest */
       (7, 'Slippers of Heedless Sacrifice', 'Feet', '556 Intellect', '275 Haste', '1', 'Cloth', 'No'), /* Black Rook Hold, Illysanna Ravencrest */
       (8, 'Leadfoot Earthshakers', 'Feet', '556 Strength', '227 Versatility', '1', 'Plate', 'No'), /* Black Rook Hold, Smashspite the Hateful */
       (9, 'Shorn Batbrood Cuffs', 'Wrist', '417 Agility', '397 Critical Strike', '1', 'Leather', 'No'), /* Black Rook Hold, Smashspite the Hateful */
       (10, 'Felbat Leather Vest', 'Chest', '742 Agility', '670 Critical Strike', '1', 'Leather', 'No'), /* Black Rook Hold, Smashspite the Hateful */
       (11, 'Mardum Chain Vest', 'Chest', '742 Intellect', '388 Versatility', '1', 'Mail', 'No') /* Black Rook Hold, Smashspite the Hateful */
on conflict do nothing;

insert into "set" (set_id, name, set_bonus)
values (1, 'robert', 'awesome')
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
       (1, 'Black Rook Hold', 'Illysanna Ravencrest'),
       (1, 'Black Rook Hold', 'Smashspite the Hateful'),
       (1, 'Black Rook Hold', 'Lord Kur''talos Ravencrest'),
       (1, 'Court of Stars', 'Patrol Captain Gerdo'),
       (1, 'Court of Stars', 'Talixae Flamewreath'),
       (1, 'Court of Stars', 'Adisor Melandrus'),
       (1, 'Eye of Azshara', 'Serpentrix'),
       (1, 'Eye of Azshara', 'Warlord Parjesh'),
       (1, 'Eye of Azshara', 'Lady Hatecoil'),
       (1, 'Eye of Azshara', 'King Deepbeard'),
       (1, 'Eye of Azshara', 'Wrath of Azshara'),
       (1, 'Halls of Valor', 'Hymdall'),
       (1, 'Halls of Valor', 'Hyrja'),
       (1, 'Halls of Valor', 'Fenryr'),
       (1, 'Halls of Valor', 'God-King Skovald'),
       (1, 'Halls of Valor', 'Odyn'),
       (1, 'Dearkheart Thicket', 'Archdruid Glaidalis'),
       (1, 'Dearkheart Thicket', 'Oakheart'),
       (1, 'Dearkheart Thicket', 'Dresaron'),
       (1, 'Dearkheart Thicket', 'Shade of Xavius'),
       (1, 'Maw of Souls', 'Ymiron'),
       (1, 'Maw of Souls', 'Harbaron'),
       (1, 'Maw of Souls', 'Helya'),
       (1, 'Neltharion''s Lair', 'Rokmora'),
       (1, 'Neltharion''s Lair', 'Ularogg Cragshaper'),
       (1, 'Neltharion''s Lair', 'Naraxas'),
       (1, 'Neltharion''s Lair', 'Dargrul the Underking'),
       (1, 'The Arcway', 'Ivanyr'),
       (1, 'The Arcway', 'Corstilax'),
       (1, 'The Arcway', 'General Xakal'),
       (1, 'The Arcway', 'Nal''tira'),
       (1, 'The Arcway', 'Advisor Vandros'),
       (1, 'Vault of the Wardens', 'Tirathon Saltheril'),
       (1, 'Vault of the Wardens', 'Ash''golm'),
       (1, 'Vault of the Wardens', 'Glazer'),
       (1, 'Vault of the Wardens', 'Cordana Felsong'),
       (1, 'Vault of the Wardens', 'Inquisitor Tormentorum'),
       (1, 'Violet Hold', 'Erekem'),
       (1, 'Violet Hold', 'Moragg'),
       (1, 'Violet Hold', 'Ichoron'),
       (1, 'Violet Hold', 'Xevozz'),
       (1, 'Violet Hold', 'Lavanthor'),
       (1, 'Violet Hold', 'Zuramat the Obliterator'),
       (1, 'Violet Hold', 'Cyanigosa')
on conflict do nothing;

insert into raid (id, raid_name, boss)
values (2, 'Emerald Nightmare', 'Ursoc'),
       (2, 'Emerald Nightmare', 'Nythendra'),
       (2, 'Emerald Nightmare', 'Dragons of Nightmare'),
       (2, 'Emerald Nightmare', 'Xavius'),
       (2, 'Emerald Nightmare', 'I''lgynoth'),
       (2, 'Emerald Nightmare', 'Elerethe Renferal'),
       (2, 'Emerald Nightmare', 'Cenarius'),
       (2, 'Trial of Valor', 'Odyn'),
       (2, 'Trial of Valor', 'Guarm'),
       (2, 'Trial of Valor', 'Helya'),
       (2, 'The Nighthold', 'Skorpyron'),
       (2, 'The Nighthold', 'Chronomatic Anomaly'),
       (2, 'The Nighthold', 'Trilliax'),
       (2, 'The Nighthold', 'Spellblade Aluriel'),
       (2, 'The Nighthold', 'High Botanist Tel''am'),
       (2, 'The Nighthold', 'Star Augur Etraeus'),
       (2, 'The Nighthold', 'Tichondrius'),
       (2, 'The Nighthold', 'Krosus'),
       (2, 'The Nighthold', 'Grand Magistrix Elisande'),
       (2, 'The Nighthold', 'Gul''dan')
on conflict do nothing;

insert into vendor (id, first_name, surname, price)
values (3, 'casey', 'poole', '2')
on conflict do nothing;