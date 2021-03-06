insert into faction (id, name)
values (1, 'Alliance'),
       (2, 'Horde')
on conflict do nothing;

insert into race (id, name, racial_trait_1, racial_trait_2)
values (1, 'Human', 'Every Man for Himself', 'The Human Spirit'),
       (2, 'Dwarf', 'Explorer', 'Diplomacy'),
       (3, 'Night Elf', 'Nature Resistance', 'Quickness'),
       (4, 'Gnome', 'Arcane Resistance', 'Nimble Fingers'),
       (5, 'Draenei', 'Gemcutting', 'Gift of the Naaru'),
       (6, 'Worgen', 'Darkflight', 'Flayer'),
       (7, 'Orc', 'Blood Fury', 'Aberration'),
       (8, 'Undead', 'Will of the Foresaken', 'Cannibalize'),
       (9, 'Tauren', 'Brawn', 'War Stomp'),
       (10, 'Troll', 'berserking', 'Da Voodoo Shuffle'),
       (11, 'Blood Elf', 'Arcane Torrent', 'Arcane Affinity'),
       (12, 'Goblin', 'Rocket Jump', 'Rocket Barrage'),
       (13, 'Pandaren', 'Bouncy', 'Inner Peace')
on conflict do nothing;

/* Relationship table linking factions to races */
insert into faction_race (faction_id, race_id)
values (1, 1),(1, 2),(1, 3),(1, 4),(1, 5),(1, 6),(1, 13),
      (2, 7),(2, 8),(2, 9),(2, 10),(2, 11),(2, 12),(2, 13)
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

/* relationship table linking races to their respective classes - EX. Trolls (race) can be Shaman (class) */
insert into race_class (race_id, class_id)
values (1, 1),(1, 3),(1, 4),(1, 5),(1, 6),(1, 7),(1, 8),(1, 10),(1, 11),
       (2, 1),(2, 3),(2, 4),(2, 5),(2, 6),(2, 7),(2, 8),(2, 9),(2, 10),(2, 11),
       (3, 1),(3, 2),(3, 3),(3, 4),(3, 5),(3, 7),(3, 8),(3, 11),
       (4, 1),(4, 3),(4, 4),(4, 5),(4, 7),(4, 8),(4, 10),(4, 11),
       (5, 1),(5, 3),(5, 4),(5, 5),(5, 6),(5, 7),(5, 9),(5, 11),
       (6, 1),(6, 2),(6, 3),(6, 4),(6, 7),(6, 8),(6, 10),(6, 11),
       (7, 1),(7, 3),(7, 4),(7, 5),(7, 8),(7, 9),(7, 10), (7, 11),
       (8, 1),(8, 3),(8, 4),(8, 5),(8, 7),(8, 8),(8, 10),(8, 11),
       (9, 1),(9, 2),(9, 3),(9, 5),(9, 6),(9, 7),(9, 9),(9, 11),
       (10, 1),(10, 2),(10, 3),(10, 4),(10, 5),(10, 7),(10, 8),(10, 9),(10, 10),(10, 11),
       (11, 1),(11, 3),(11, 4),(11, 5),(11, 6),(11, 7),(11, 8),(11, 10),(11, 11),
       (12, 1),(12, 3),(12, 4),(12, 7),(12, 8),(12, 9),(12, 10),(12, 11),
       (13, 3),(13, 4),(13, 5),(13, 7),(13, 8),(13, 9),(13, 11)
on conflict do nothing;

/* Relationship table linking classes to their respective specialization - EX. Elemental is a specialization of Shaman */
insert into specialization (id, class_id, specialization_name)
values (1, 1, 'Blood'),
       (2, 1, 'Frost'),
       (3, 1, 'Unholy'),
       (4, 2, 'Balance'),
       (5, 2, 'Restoration'),
       (6, 2, 'Guardian'),
       (7, 2, 'Feral'),
       (8, 3, 'Beast Mastery'),
       (9, 3, 'Survival'),
       (10, 3, 'Marksmanship'),
       (11, 4, 'Arcane'),
       (12, 4, 'Fire'),
       (13, 4, 'Frost'),
       (14, 5, 'Brewmaster'),
       (15, 5, 'Mistweaver'),
       (16, 5, 'Windwalker'),
       (17, 6, 'Holy'),
       (18, 6, 'Retribution'),
       (19, 6, 'Protection'),
       (20, 7, 'Discipline'),
       (21, 7, 'Holy'),
       (22, 7, 'Shadow'),
       (23, 8, 'Assassination'),
       (24, 8, 'Combat'),
       (25, 8, 'Subtlety'),
       (26, 9, 'Elemental'),
       (27, 9, 'Restoration'),
       (28, 9, 'Enhancement'),
       (29, 10, 'Affliction'),
       (30, 10, 'Demonology'),
       (31, 10, 'Destruction'),
       (32, 11, 'Arms'),
       (33, 11, 'Fury'),
       (34, 11, 'Protection')
on conflict do nothing;

/* Certain pieces of gear do not have a material type, such as back pieces and necklaces
   I used NULL to represent these

   I put notes next to each insert value to note where they come from.
 */
insert into gear (id, name, slot, primary_stat_val, primary_stat, sec_stat_1_val, secondary_stat_1, sec_stat_2_val, secondary_stat_2, material, tradable)
values (1, 'Rook Footman''s Warboots', 'Feet', 556, 'Strength', 243, 'Critical Strike', 233, 'Haste', 'Plate', False), /* Black Rook Hold, Amalgam of Souls */
       (2, 'Shadowfeather Shawl', 'Back', 417, 'Agility', 389, 'Haste', 401, 'Mastery', NULL, False), /* Black Rook Hold, Amalgam of Souls */
       (3, 'Etheldrin''s Breastplate', 'Chest', 742, 'Strength', 705, 'Mastery', 834, 'Critical Strike', 'Plate', False), /* Black Rook Hold, Amalgam of Souls */
       (4, 'Ravencourt Formal Robes', 'Chest', 742, 'Intellect', 367, 'Critical Strike', 355, 'Versatility', 'Cloth', False), /* Black Rook Hold, Amalgam of Souls */
       (5, 'Soulstarve Hood', 'Head', 742, 'Agility', 599, 'Haste', 607, 'Mastery', 'Leather', False), /* Black Rook Hold, Illysanna Ravencrest */
       (6, 'Soul-Torn Fury Cinch', 'Waist', 556, 'Intellect', 259, 'Critical Strike', 204, 'Versatility', 'Mail', False), /* Black Rook Hold, Illysanna Ravencrest */
       (7, 'Slippers of Heedless Sacrifice', 'Feet', 556, 'Intellect', 275, 'Haste', 301, 'Critical Strike', 'Cloth', False), /* Black Rook Hold, Illysanna Ravencrest */
       (8, 'Leadfoot Earthshakers', 'Feet', 556, 'Strength', 227, 'Versatility', 237, 'Mastery', 'Plate', False), /* Black Rook Hold, Smashspite the Hateful */
       (9, 'Shorn Batbrood Cuffs', 'Wrist', 417, 'Agility', 397, 'Critical Strike', 405, 'Haste', 'Leather', False), /* Black Rook Hold, Smashspite the Hateful */
       (10, 'Felbat Leather Vest', 'Chest', 742, 'Agility', 670, 'Critical Strike', 699, 'Mastery', 'Leather', False), /* Black Rook Hold, Smashspite the Hateful */
       (11, 'Mardum Chain Vest', 'Chest', 742, 'Intellect', 388, 'Versatility', 378, 'Haste', 'Mail', False), /* Black Rook Hold, Smashspite the Hateful */
       (12, 'Drape of the Raven Lord', 'Back', 234, 'Strength', 198, 'Haste', 357, 'Mastery', NULL, False), /* Black Rook Hold, Lord Ravencrest */
       (13, 'Legguards of Endless Horrors', 'Legs', 742, 'Agility', 664, 'Haste', 324, 'Versatility', 'Leather', False), /* Black Rook Hold, Lord Ravencrest */
       (14, 'Ravencrest''s Unerring Striders', 'Feet', 556, 'Intellect', 497, 'Haste', 243, 'Mastery', 'Mail', False), /* Black Rook Hold, Lord Ravencrest */
       (15, 'Arcanist''s Resonant Robes', 'Chest', 1182, 'Intellect', 763, 'Haste', 494, 'Mastery', 'Cloth', False), /* Court of stars, Patrol Captain Gerdo */
       (16, 'Manawracker Sandals', 'Feet', 886, 'Intellect', 289, 'Haste', 653, 'Mastery', 'Cloth', False), /* Court of stars, Patrol Captain Gerdo */
       (17, 'Guileful Intruder Handguards', 'Hands', 886, 'Agility', 653, 'Critical Strike', 289, 'Haste', 'Leather', False), /* Court of stars, Patrol Captain Gerdo */
       (18, 'Chain of Scorched Bones', 'Neck', 997, 'Stamina', 1163, 'Haste', 606, 'Versatility', NULL, False), /* Court of stars, Talixae Flamewreath */
       (19, 'Felbat Leather Pauldrons', 'Shoulder', 886, 'Agility', 552, 'Critical Strike', 391, 'Versatility', 'Leather', False), /* Court of stars, Talixae Flamewreath */
       (20, 'Inferno Breastplate', 'Chest', 1182, 'Intellect', 494, 'Critical Strike', 763, 'Haste', 'Plate', False), /* Court of stars, Talixae Flamewreath */
       (21, 'Veil of Unseen Strikes', 'Head', 1182, 'Agility', 440, 'Versatility', 817, 'Mastery', 'Leather', False), /* Court of stars, Advisor Melandrus */
       (22, 'Suramar Magistrate Leggings', 'Legs', 1182, 'Intellect', 844, 'Haste', 413, 'Versatility', 'Cloth', False), /* Court of stars, Advisor Melandrus */
       (23, 'Seawitch Gloves', 'Hands', 556, 'Intellect', 291, 'Versatility', 450, 'Mastery', 'Cloth', False), /* Eye of Azshara, Warlord Parjesh */
       (24, 'Coralplate Chestguard', 'Chest', 742, 'Strength', 324, 'Versatility', 663, 'Mastery', 'Plate', False), /* Eye of Azshara, Warlord Parjesh */
       (25, 'Brinewashed Leather Pant', 'Legs', 742, 'Intellect', 367, 'Versatility', 620, 'Mastery', 'Leather', False), /* Eye of Azshara, Lady Hatecoil */
       (26, 'Horizon Line Warboots', 'Feet', 556, 'Strength', 497, 'Critical Strike', 242, 'Haste', 'Plate', False), /* Eye of Azshara, Lady Hatecoil */
       (27, 'Cord of the Sea-Caller', 'Waist', 556, 'Intellect', 242, 'Haste', 497, 'Versatility', 'Cloth', False), /* Eye of Azshara, Lady Hatecoil */
       (28, 'Tunic of the Pitiless Monstrosity', 'Chest', 742, 'Agility', 282, 'Critical Strike', 705, 'Mastery', 'Leather', False), /* Eye of Azshara, Serpentrix */
       (29, 'Coralplate Pauldrons', 'Shoulder', 556, 'Strength', 275, 'Versatility', 466, 'Mastery', 'Plate', False), /* Eye of Azshara, Serpentrix */
       (30, 'Brinewashed Leather Grips', 'Hands', 556, 'Intellect', 307, 'Versatility', 434, 'Mastery', 'Leather', False), /* Eye of Azshara, Serpentrix */
       (31, 'Taut Halyard Waistband', 'Waist', 556, 'Agility', 513, 'Haste', 227, 'Versatility', 'Leather', False), /* Eye of Azshara, King Deepbeard */
       (32, 'Rising Ocean Legwraps', 'Legs', 742, 'Intellect', 409, 'Critical Strike', 578, 'Mastery', 'Cloth', False), /* Eye of Azshara, King Deepbeard */
       (33, 'Keelhauler Legplates', 'Legs', 742, 'Strength', 367, 'Critical Strike', 620, 'Haste', 'Plate', False), /* Eye of Azshara, King Deepbeard */
       (34, 'Thundercrush Pauldrons', 'Shoulder', 556, 'Agility', 291, 'Haste', 450, 'Mastery', 'Mail', False), /* Eye of Azshara, Wrath of Azshara */
       (35, 'Stormcharged Choker', 'Neck', 626, 'Stamina', 952, 'Critical Strike', 436, 'Mastery', NULL, False), /* Eye of Azshara, Wrath of Azshara */
       (36, 'Slippers of Martydom', 'Feet', 556, 'Intellect', 513, 'Haste', 227, 'Mastery', 'Cloth', False), /* Eye of Azshara, Wrath of Azshara */
       (37, 'Brinewashed Leather Boots', 'Feet', 556, 'Agility', 243, 'Versatility', 497, 'Mastery', 'Leather', False), /* Eye of Azshara, Wrath of Azshara */
       (38, 'Biornskin Leggings', 'Legs', 742, 'Intellect', 599, 'Critical Strike', 388, 'Mastery', 'Leather', False), /* Halls of Valor, Hymdall */
       (39, 'Bonespeaker Cowl', 'Head', 742, 'Intellect', 684, 'Critical Strike', 303, 'Mastery', 'Cloth', False), /* Halls of Valor, Hymdall */
       (40, 'Skoldiir Breastplate', 'Chest', 742, 'Intellect', 620, 'Critical Strike', 367, 'Mastery', 'Plate', False), /* Halls of Valor, Hymdall */
       (41, 'Cushioned Treads of Glory', 'Feet', 556, 'Intellect', 291, 'Haste', 450, 'Mastery', 'Cloth', False), /* Halls of Valor, Hymdall */
       (42, 'Tideskin Gauntlets', 'Hands', 556, 'Agility', 513, 'Critical Strike', 227, 'Mastery', 'Mail', False), /* Halls of Valor, Hyrja */
       (43, 'Thunderfused Val''kyr Hauberk', 'Chest', 742, 'Agility', 303, 'Haste', 684, 'Mastery', 'Mail', False), /* Halls of Valor, Hyrja */
       (44, 'Valkyra Protector Greatboots', 'Feet', 556, 'Strength', 481, 'Haste', 259, 'Mastery', 'Plate', False), /* Halls of Valor, Hyrja */
       (45, 'Silken Bloodscent Gloves', 'Hands', 556, 'Intellect', 481, 'Critical Strike', 259, 'Haste', 'Cloth', False), /* Halls of Valor, Fenryr */
       (46, 'Runebands of the worthy', 'Wrist', 417, 'Intellect', 182, 'Critical Strike', 373, 'Haste', 'Mail', False), /* Halls of Valor, Fenryr */
       (47, 'Hide of Fenryr', 'Chest', 742, 'Agility', 578, 'Haste', 409, 'Mastery', 'Leather', False), /* Halls of Valor, Fenryr */
       (48, 'Infernal Mantle of Conquest', 'Shoulder', 556, 'Intellect', 227, 'Haste', 513, 'Mastery', 'Cloth', False), /* Halls of Valor, God-King Skavald */
       (49, 'Skoldiir Helm', 'Head', 742, 'Strength', 684, 'Critical Strike', 303, 'Mastery', 'Plate', False), /* Halls of Valor, God-King Skavald */
       (50, 'Felstep Footguards', 'Feet', 556, 'Intellect', 212, 'Critical Strike', 529, 'Mastery', 'Mail', False), /* Halls of Valor, God-King Skavald */
       (51, 'Cape of Valarjar Courage', 'Back', 417, 'Strength', 278, 'Versatility', 278, 'Mastery', NULL, False), /* Halls of Valor, Odyn */
       (52, 'Pauldrons of the All-Father', 'Shoulder', 556, 'Strength', 434, 'Haste', 307, 'Mastery', 'Plate', False), /* Halls of Valor, Odyn */
       (53, 'Wristbands of Magnificent Splendor', 'Wrist', 417, 'Intellect', 206, 'Critical Strike', 349, 'Versatility', 'Plate', False), /* Halls of Valor, Odyn */
       (54, 'Treads of Light', 'Feet', 556, 'Intellect', 275, 'Critical Strike', 466, 'Versatility', 'Cloth', False), /* Halls of Valor, Odyn */
       (55, 'Solid Gold Bracelets', 'Wrist', 417, 'Agility', 337, 'Critical Strike', 218, 'Versatility', 'Mail', False), /* Halls of Valor, Odyn */
       (56, 'Crown of Fallen Kings', 'Head', 742, 'Strength', 705, 'Critical Strike', 282, 'Mastery', 'Plate', False), /* Maw of Souls, Ymiron */
       (57, 'Biornskin Belt', 'Waist', 556, 'Intellect', 434, 'Critical Strike', 307, 'Mastery', 'Leather', False), /* Maw of Souls, Ymiron */
       (58, 'Tideskorn Sabatons', 'Feet', 556, 'Agility', 434, 'Critical Strike', 307, 'Mastery', 'Mail', False), /* Maw of Souls, Ymiron */
       (59, 'Skoldiir Legguards', 'Legs', 742, 'Strength', 684, 'Critical Strike', 303, 'Mastery', 'Plate', False), /* Maw of Souls, Harbaron */
       (60, 'Void-Touched Wristplates', 'Wrist', 417, 'Intellect', 397, 'Haste', 159, 'Mastery', 'Plate', False), /* Maw of Souls, Harbaron */
       (61, 'Soul-Stitched Robes', 'Chest', 742, 'Intellect', 578, 'Versatility', 409, 'Mastery', 'Cloth', False), /* Maw of Souls, Harbaron */
       (62, 'Belt of Eternal Torment', 'Waist', 556, 'Intellect', 212, 'Haste', 529, 'Mastery', 'Cloth', False), /* Maw of Souls, Helya */
       (63, 'Kraken Hide Helm', 'Head', 742, 'Agility', 367, 'Haste', 620, 'Versatility', 'Leather', False), /* Maw of Souls, Helya */
       (64, 'Salt-Laden Stompers', 'Feet', 556, 'Intellect', 291, 'Critical Strike', 450, 'Versatility', 'Plate', False), /* Maw of Souls, Helya */
       (65, 'Thornscar Wristguards', 'Wrist', 417, 'Strength', 194, 'Critical Strike', 361, 'Mastery', 'Plate', False), /* Darkheart Thicket, Archdruid Glaidalis */
       (66, 'Tranquil Bough Vest', 'Chest', 742, 'Agility', 663, 'Haste', 324, 'Mastery', 'Leather', False), /* Darkheart Thicket, Archdruid Glaidalis */
       (67, 'Night Dreamer Crest', 'Head', 742, 'Intellect', 684, 'Haste', 303, 'Mastery', 'Cloth', False), /* Darkheart Thicket, Archdruid Glaidalis */
       (68, 'Breastplate of Preservation', 'Chest', 742, 'Strength', 684, 'Critical Strike', 303, 'Mastery', 'Plate', False), /* Darkheart Thicket, Oakheart */
       (69, 'Dreadhide Girdle', 'Waist', 556, 'Intellect', 434, 'Critical Strike', 307, 'Haste', 'Leather', False), /* Darkheart Thicket, Oakheart */
       (70, 'Blighted Grasp Bracers', 'Wrist', 417, 'Agility', 206, 'Haste', 349, 'Versatility', 'Mail', False), /* Darkheart Thicket, Oakheart */
       (71, 'Tranquil Bough Hood', 'Head', 742, 'Agility', 684, 'Haste', 303, 'Mastery', 'Leather', False), /* Darkheart Thicket, Dresaron */
       (72, 'Slipstream Shoulderpads', 'Shoulder', 556, 'Intellect', 481, 'Haste', 259, 'Mastery', 'Cloth', False), /* Darkheart Thicket, Dresaron */
       (73, 'Thermal Bindings', 'Wrist', 417, 'Intellect', 182, 'Critical Strike', 373, 'Mastery', 'Leather', False), /* Darkheart Thicket, Dresaron */
       (75, 'Ashen Satyr Leggings', 'Legs', 742, 'Agility', 642, 'Critical Strike', 345, 'Haste', 'Leather', False), /* Darkheart Thicket, Shade of Xavius */
       (76, 'Dream Bolstered Chestguard', 'Chest', 742, 'Intellect', 409, 'Critical Strike', 578, 'Mastery', 'Mail', False), /* Darkheart Thicket, Shade of Xavius */
       (77, 'Burning Sky Pauldrons', 'Shoulder', 556, 'Agility', 513, 'Haste', 227, 'Mastery', 'Mail', False), /* Darkheart Thicket, Shade of Xavius */
       (78, 'Shoulderbuckle Strap', 'Waist', 556, 'Agility', 481, 'Haste', 259, 'Mastery', 'Mail', False), /* Neltharion's Lair, Rokmora */
       (79, 'Rivermade Sandals', 'Feet', 556, 'Intellect', 238, 'Critical Strike', 503, 'Haste', 'Leather', False), /* Neltharion's Lair, Rokmora */
       (80, 'Skyhorn Mantle', 'Shoulder', 556, 'Agility', 275, 'Critical Strike', 466, 'Haste', 'Mail', False), /* Neltharion's Lair, Rokmora */
       (81, 'Cragshaper''s Fitted Hood', 'Head', 742, 'Intellect', 409, 'Critical Strike', 578, 'Haste', 'Cloth', False), /* Neltharion's Lair, Ularogg Cragshaper */
       (82, 'Bitestone Wristwrap', 'Wrist', 417, 'Intellect', 385, 'Haste', 170, 'Versatility', 'Mail', False), /* Neltharion's Lair, Ularogg Cragshaper */
       (83, 'Steelgazer Hide Hood', 'Head', 742, 'Agility', 705, 'Haste', 282, 'Versatility', 'Leather', False), /* Neltharion's Lair, Ularogg Cragshaper */
       (84, 'Subterranean Horror Faceguard', 'Head', 742, 'Intellect', 388, 'Haste', 599, 'Mastery', 'Plate', False), /* Neltharion's Lair, Naraxas */
       (85, 'Gauntlets of Innumerable Barbs', 'Hands', 556, 'Agility', 243, 'Critical Strike', 497, 'Mastery', 'Mail', False), /* Neltharion's Lair, Naraxas */
       (86, 'Wristbands of Rousing Violence', 'Wrist', 417, 'Intellect', 159, 'Haste', 397, 'Mastery', 'Leather', False), /* Neltharion's Lair, Naraxas */
       (87, 'Steelgazer Hide Mantle', 'Shoulder', 556, 'Intellect', 434, 'Haste', 307, 'Versatility', 'Leather', False), /* Neltharion's Lair, Dargrul */
       (88, 'Faultline Leggings', 'Legs', 742, 'Agility', 599, 'Critical Strike', 338, 'Mastery', 'Mail', False), /* Neltharion's Lair, Dargrul */
       (89, 'Gloves of the Mountain Conquest', 'Hands', 556, 'Intellect', 466, 'Haste', 275, 'Mastery', 'Cloth', False), /* Neltharion's Lair, Dargrul */
       (90, 'Sinister Ashfall Cord', 'Waist', 556, 'Agility', 529, 'Critical Strike', 212, 'Mastery', 'Leather', False), /* Neltharion's Lair, Dargrul */
       (91, 'Tunnel Trudger Footguards', 'Feet', 886, 'Intellect', 674, 'Critical Strike', 269, 'Haste', 'Leather', False), /* The Arcway, Ivanyr */
       (92, 'Crackling Overcharge Chestguard', 'Chest', 1182, 'Strength', 763, 'Critical Strike', 494, 'Versatility', 'Plate', False), /* The Arcway, Ivanyr */
       (93, 'Arcane Defender''s Belt', 'Waist', 886, 'Strength', 391, 'Haste', 552, 'Mastery', 'Plate', False), /* The Arcway, Ivanyr */
       (94, 'Decontaminated Chain Tunic', 'Chest', 1182, 'Agility', 817, 'Critical Strike', 440, 'Versatility', 'Mail', False), /* The Arcway, Corstilax */
       (95, 'Spaulders of Aberrant Inhibition', 'Shoulder', 886, 'Intellect', 269, 'Critical Strike', 674, 'Mastery', 'Leather', False), /* The Arcway, Corstilax */
       (96, 'Collar of Enclosure', 'Head', 1182, 'Intellect', 844, 'Critical Strike', 413, 'Haste', 'Cloth', False), /* The Arcway, Corstilax */
       (97, 'Legwraps of the Reverberating Shadows', 'Legs', 1182, 'Intellect', 494, 'Critical Strike', 763, 'Haste', 'Cloth', False), /* The Arcway, General Xakal */
       (98, 'Fist of the Legion', 'Hands', 886, 'Strength', 440, 'Haste', 613, 'Mastery', 'Plate', False), /* The Arcway, General Xakal */
       (99, 'Bloodclaw Leggings', 'Legs', 1182, 'Agility', 817, 'Haste', 440, 'Mastery', 'Leather', False), /* The Arcway, General Xakal */
       (100, 'Tunnel Fiend Bracers', 'Wrist', 665, 'Intellect', 459, 'Critical Strike', 247, 'Versatility', 'Cloth', False), /* The Arcway, Nal'tira */
       (101, 'Greathelm of Barbed Chelicerae', 'Head', 1182, 'Strength', 440, 'Critical Strike', 817, 'Mastery', 'Plate', False), /* The Arcway, Nal'tira */
       (102, 'Cloak of the Mana-Spun Silk', 'Back', 665, 'Strength', 455, 'Critical Strike', 252, 'Versatility', NULL, False), /* The Arcway, Nal'tira */
       (103, 'Treads of the Fates Entwined', 'Feet', 666, 'Intellect', 674, 'Critical Strike', 269, 'Mastery', 'Plate', False), /* The Arcway, Advisor Vandros */
       (104, 'Mana-Laced Gloves', 'Hands', 886, 'Agility', 572, 'Versatility', 370, 'Mastery', 'Leather', False), /* The Arcway, Advisor Vandros */
       (105, 'Manawracker Crown', 'Head', 1182, 'Intellect', 494, 'Haste', 763, 'Mastery', 'Cloth', False), /* The Arcway, Advisor Vandros */
       (106, 'Scored Ironclaw Sabatons', 'Feet', 973, 'Intellect', 615, 'Critical Strike', 363, 'Haste', 'Mail', False), /* Emerald Nightmare, Ursoc */
       (107, 'Splotched Bloodfur Leggings', 'Legs', 1297, 'Agility', 932, 'Critical Strike', 372, 'Mastery', 'Leather', False), /* Emerald Nightmare, Ursoc */
       (108, 'Primal Gauntlets of Rage', 'Hands', 973, 'Strength', 699, 'Critical Strike', 279, 'Haste', 'Plate', False), /* Emerald Nightmare, Ursoc */
       (109, 'Lifeless Buckled Girdle', 'Waist', 973, 'Agility', 406, 'Versatility', 574, 'Mastery', 'Leather', False), /* Emerald Nightmare, Nythendra */
       (110, 'Greyed Dragonscale Coif', 'Head', 1297, 'Intellect', 568, 'Critical Strike', 736, 'Mastery', 'Mail', False), /* Emerald Nightmare, Nythendra */
       (111, 'Wristclamps of Mad Dreams', 'Wrist', 729, 'Strength', 445, 'Critical Strike', 288, 'Haste', 'Plate', False), /* Emerald Nightmare, Nythendra */
       (112, 'Horror Inscribed Chestguard', 'Chest', 1297, 'Intellect', 932, 'Critical Strike', 372, 'Haste', 'Plate', False), /* Emerald Nightmare, Dragons of Nightmare */
       (113, 'Cowl of Fright', 'Head', 1297, 'Agility', 456, 'Critical Strike', 848, 'Mastery', 'Leather', False), /* Emerald Nightmare, Dragons of Nightmare */
       (114, 'Malignant Sabatons', 'Feet', 1459, 'Intellect', 699, 'Critical Strike', 279, 'Haste', 'Mail', False), /* Emerald Nightmare, Dragons of Nightmare */
       (115, 'Disjointed Linkage Leggings', 'Legs', 1297, 'Agility', 512, 'Critical Strike', 792, 'Haste', 'Mail', False), /* Emerald Nightmare, Xavius */
       (116, 'Midnight Herald''s Pauldrons', 'Shoulder', 974, 'Strength', 322, 'Critical Strike', 658, 'Haste', 'Plate', False), /* Emerald Nightmare, Xavius */
       (117, 'Maddening Robe of Secrets', 'Chest', 1297, 'Intellect', 428, 'Critical Strike', 876, 'Mastery', 'Cloth', False), /* Emerald Nightmare, Xavius */
       (118, 'Cinch of Cosmic Insignficance', 'Wrist', 729, 'Intellect', 509, 'Haste', 225, 'Mastery', 'Cloth', False), /* Emerald Nightmare, I'lgynoth */
       (119, 'Pauldrons of Shifting Runes', 'Shoulder', 973, 'Strength', 553, 'Critical Strike', 426, 'Versatility', 'Plate', False), /* Emerald Nightmare, I'lgynoth */
       (120, 'Singular Chain Leggings', 'Legs', 1297, 'Agility', 400, 'Haste', 904, 'Mastery', 'Mail', False), /* Emerald Nightmare, I'lgynoth */
       (121, 'Patient Ambusher''s Hauberk', 'Chest', 1297, 'Intellect', 848, 'Critical Strike', 456, 'Mastery', 'Mail', False), /* Emerald Nightmare, Elerethe Renferal */
       (122, 'Pliable Spider Silk Cinch', 'Waist', 973, 'Intellect', 363, 'Critical Strike', 615, 'Mastery', 'Cloth', False), /* Emerald Nightmare, Elerethe Renferal */
       (123, 'Mask of Multitudinous Eyes', 'Head', 1297, 'Agility', 932, 'Critical Strike', 372, 'Versatility', 'Leather', False), /* Emerald Nightmare, Elerethe Renferal */
       (124, 'Forest-Lord''s Waistwrap', 'Waist', 973, 'Agility', 637, 'Haste', 342, 'Mastery', 'Leather', False), /* Emerald Nightmare, Cenarius */
       (125, 'Cozy Dryad Hoof-Socks', 'Feet', 973, 'Intellect', 322, 'Critical Strike', 658, 'Haste', 'Cloth', False), /* Emerald Nightmare, Cenarius */
       (126, 'Fitted Ironbark Gauntlets', 'Hands', 973, 'Strength', 637, 'Haste', 342, 'Mastery', 'Plate', False), /* Emerald Nightmare, Cenarius */
       (127, 'Cinch of Light', 'Waist', 1068, 'Intellect', 290, 'Haste', 726, 'Mastery', 'Cloth', False), /* Trial of Valor, Odyn */
       (128, 'Gloves of Issued Challenge', 'Hands', 1068, 'Agility', 399, 'Critical Strike', 617, 'Mastery', 'Leather', False), /* Trial of Valor, Odyn */
       (129, 'Goldrune Legplates', 'Legs', 1424, 'Strength', 445, 'Critical Strike', 910, 'Mastery', 'Plate', False), /* Trial of Valor, Odyn */
       (130, 'Lead-Soled Seabed Striders', 'Feet', 1068, 'Intellect', 978, 'Haste', 765, 'Mastery', 'Mail', False), /* Trial of Valor, Guarm */
       (131, 'Helbeast Skin Tunic', 'Chest', 1424, 'Agility', 561, 'Haste', 794, 'Versatility', 'Leather', False), /* Trial of Valor, Guarm */
       (132, 'Bite-Resistant Wristclamps', 'Wrist', 801, 'Intellect', 316, 'Mastery', 446, 'Haste', 'Mail', False), /* Trial of Valor, Guarm */
       (133, 'Krakenbone Waistplate', 'Waist', 1119, 'Strength', 407, 'Haste', 628, 'Mastery', 'Plate', False), /* Trial of Valor, Helya */
       (134, 'Oiled Rigger''s Handwraps', 'Hands', 1119, 'Intellect', 673, 'Critical Strike', 362, 'Versatility', 'Cloth', False), /* Trial of Valor, Helya */
       (135, 'Strand of Whelk Shells', 'Waist', 1119, 'Agility', 606, 'Haste', 429, 'Mastery', 'Leather', False), /* Trial of Valor, Helya */
       (136, 'Helm of Shackled Elements', 'Head', 1647, 'Intellect', 778, 'Mastery', 655, 'Haste', 'Mail', False), /* Shackled Elements Set */
       (137, 'Pauldrons of Shackled Elements', 'Shoulder', 1228, 'Intellect', 606, 'Critical Strike', 468, 'Versatility', 'Mail', False), /* Shackled Elements Set */
       (138, 'Raiment of Shackled Elements', 'Chest', 1637, 'Intellect', 594, 'Critical Strike', 839, 'Mastery', 'Mail', False), /* Shackled Elements Set */
       (139, 'Gauntlets of Shackled Elements', 'Hands', 1228, 'Intellect', 491, 'Critical Strike', 583, 'Haste', 'Mail', False), /* Shackled Elements Set */
       (140, 'Creeping of Shackled Elements', 'Waist', 973, 'Intellect', 637, 'Haste', 491, 'Critical Strike', 'Mail', False), /* Shackled Elements Set */
       (141, 'Leggings of Shackled Elements', 'Legs', 1637, 'Intellect', 532, 'Versatility', 901, 'Mastery', 'Mail', False), /* Shackled Elements Set */
       (142, 'Hood of Enveloped Dissonance' , 'Head', 1637, 'Agility', 624, 'Critical Strike', 809, 'Haste', 'Leather', False), /* Enveloped Dissonance Set */
       (143, 'Pauldrons of Enveloped Dissonance', 'Shoulder', 921, 'Agility', 576, 'Critical Strike', 230, 'Haste', 'Leather', False), /* Enveloped Dissonance Set */
       (144, 'Tunic of Enveloped Dissonance', 'Chest', 1637, 'Agility', 778, 'Haste', 655, 'Versatility', 'Leather', False), /* Enveloped Dissonance Set */
       (145, 'Gloves of Enveloped Dissonance', 'Wrist', 1228, 'Agility', 675, 'Critical Strike', 399, 'Haste', 'Leather', False), /* Enveloped Dissonance Set */
       (146, 'Lifeless Buckled Girdle', 'Waist', 973, 'Agility', 406, 'Versatility', 574, 'Mastery', 'Leather', False), /* Enveloped Dissonance Set */
       (147, 'Leggings of Enveloped Dissonance', 'Legs', 1637, 'Agility', 993, 'Critical Strike', 440, 'Mastery', 'Leather', False), /* Enveloped Dissonance Set */
       (148, 'Doomblade Cowl', 'Head', 1637, 'Agility', 471, 'Critical Strike', 962, 'Mastery', 'Leather', False), /*Doomblade Set*/
       (149, 'Doomblade Spaulders', 'Shoulder', 1228, 'Agility', 330, 'Haste', 744, 'Mastery', 'Leather', False), /*Doomblade Set*/
       (150, 'Doomblade Tunic', 'Chest', 1228, 'Agility', 330, 'Haste', 786, 'Critical Strike', 'Leather', False), /*Doomblade Set*/
       (151, 'Doomblade Gauntlets', 'Hands', 1228, 'Agility', 330, 'Mastery', 625, 'Critical Strike', 'Leather', False), /*Doomblade Set*/
       (152, 'Doomblade Shadowwrap', 'Waist', 1228, 'Agility', 412, 'Critical Strike', 786, 'Versatility', 'Leather', False), /*Doomblade Set*/
       (153, 'Doomblade Pants', 'Legs', 1228, 'Agility', 339, 'Haste', 786, 'Mastery', 'Leather', False) /*Doomblade Set*/
on conflict do nothing;

/* Gear associated with prices */
insert into gear (id, name, slot, primary_stat_val, primary_stat, sec_stat_1_val, secondary_stat_1, sec_stat_2_val, secondary_stat_2, material, tradable, price)
values (74, 'Godpiece', 'Neck', 12000, 'Strength', 6250, 'Critical Strike', 8924, 'Mastery', NULL, True, 1000000),
       (154, 'Amulet of Garglefish', 'Neck', 12315, 'Intellect', 6100, 'Critical Strike', 8774, 'Mastery', NULL, True, 1000000),
       (155, 'Robert''s Head', 'Head', 5317, 'Strength', 4892, 'Versatility', 5048, 'Mastery', 'Plate', True, 999),
       (156, 'Robert''s Shoulders', 'Shoulder', 2216, 'Strength', 1812, 'Haste', 1987, 'Mastery', 'Plate', True, 3456),
       (157, 'Robert''s Chest', 'Chest', 2215, 'Strength', 1812, 'Versatility', 1987, 'Haste', 'Plate', True, 17678),
       (158, 'Robert''s Hands', 'Hands', 2215, 'Strength', 1812, 'Versatility', 1987, 'Critical Strike', 'Plate', True, 42),
       (159, 'Robert''s Waist', 'Waist', 2215, 'Strength', 1812, 'Critical Strike', 1987, 'Versatility', 'Plate', True, 15843),
       (160, 'Robert''s Legs', 'Legs', 2215, 'Strength', 1812, 'Haste', 1987, 'Critical Strike', 'Plate', True, 10000),
       (161, 'Casey''s Head', 'Head', 5317, 'Intellect', 4892, 'Versatility', 5048, 'Mastery', 'Plate', True, 4547),
       (162, 'Casey''s Shoulders', 'Shoulder', 2216, 'Intellect', 1812, 'Haste', 1987, 'Mastery', 'Plate', True, 2098),
       (163, 'Casey''s Chest', 'Chest', 2215, 'Intellect', 1812, 'Versatility', 1987, 'Haste', 'Plate', True, 12907),
       (164, 'Casey''s Hands', 'Hands', 2215, 'Intellect', 1812, 'Versatility', 1987, 'Critical Strike', 'Plate', True, 100405),
       (165, 'Casey''s Waist', 'Waist', 2215, 'Intellect', 1812, 'Critical Strike', 1987, 'Versatility', 'Plate', True, 143),
       (166, 'Casey''s Legs', 'Legs', 2215, 'Intellect', 1812, 'Haste', 1987, 'Critical Strike', 'Plate', True, 376),
       (167, 'Arcanoweave Boots', 'Feet', 270, 'Stamina', 115, 'Haste', 290, 'Versatility', 'Cloth', True, 263),
       (168, 'Nat Pagle''s Extreme Anglin'' Boots', 'Feet', 120, 'Stamina', 50, 'Versatility', 90, 'Mastery', 'Cloth', True, 58),
       (169, 'Kodo Rustler Boots', 'Feet', 800, 'Intellect', 300, 'Versatility', 200, 'Critical Strike', 'Cloth', True, 49),
       (170, 'High Councillor''s Boots', 'Feet', 1048, 'Strength', 780, 'Mastery', 546, 'Haste', 'Cloth', True, 2279),
       (171, 'Imbued Netherweave Boots', 'Feet', 1173, 'Intellect', 985, 'Versatility', 1011, 'Mastery', 'Cloth', True, 5705),
       (172, 'Boots of Pure Thought', 'Feet', 2215, 'Intellect', 1490, 'Haste', 1764, 'Critical Strike', 'Cloth', True, 3945),
       (173, 'Leggings of the Skettis Exile', 'Legs', 2334, 'Stamina', 1257, 'Versatility', 1033, 'Mastery', 'Plate', True, 6104),
       (174, 'Soulguard Leggings', 'Legs', 3829, 'Stamina', 2367, 'Critical Strike', 3465, 'Mastery', 'Leather', True, 8804),
       (175, 'Heap Leggings', 'Legs', 2317, 'Stamina', 1811, 'Critical Strike', 1811, 'Haste', 'Cloth', True, 4750),
       (176, 'Big Voodoo Pants', 'Legs', 1790, 'Intellect', 815, 'Versatility', 1038, 'Haste', 'Leather', True, 1231),
       (177, 'Leggings of the Fang', 'Legs', 1077, 'Agility', 513, 'Haste', 787, 'Mastery', 'Leather', True, 353),
       (178, 'Purple Shirt', 'Chest', 577, 'Agility', 213, 'Haste', 389, 'Mastery', 'Leather', True, 153),
       (179, 'Runecloth Shoulders', 'Shoulder', 1510, 'Intellect', 804, 'Versatility', 899, 'Mastery', 'Cloth', True, 2122),
       (180, 'Diabollic Mantle', 'Shoulder', 1417, 'Stamina', 952, 'Versatility', 1112, 'Critical Strike', 'Leather', True, 2632),
       (181, 'Highborne Pauldrons', 'Shoulder', 1211, 'Stamina', 673, 'Mastery', 757, 'Critical Strike', 'Plate', True, 1545),
       (182, 'Tabard of the Arcane', 'Neck', 500, 'Intellect', 250, 'Haste', 250, 'Mastery', NULL, True, 1000),
       (183, 'Embroidered Belt', 'Waist', 197, 'Stamina', 83, 'Haste', 107, 'Mastery', 'Cloth', True, 53),
       (184, 'Mystical Belt', 'Waist', 315, 'Intellect', 208, 'Versatility', 169, 'Mastery', 'Cloth', True, 94),
       (185, 'Firemaw''s Clutch', 'Waist', 2016, 'Intellect', 1098, 'Versatility', 1567, 'Mastery', 'Cloth', True, 2860),
       (186, 'Faulty Countermeasure', 'Neck', 3400,'Intellect', 1834, 'Critical Strike', 1976, 'Mastery', Null, True, 46279),
       (187, 'Swarming Plaguehive', 'Neck', 2353, 'Intellect', 1932, 'Haste', 1779, 'Versatility', NULL, True, 49355),
       (188, 'Eye of Command', 'Neck', 2353, 'Strength', 2074, 'Critical Strike', 1961, 'Mastery', NULL, True, 51915),
       (189, 'Unstable Arcanocrystal', 'Neck', 2015, 'Intellect', 1807, 'Versatility', 1807, 'Mastery', NULL, True, 48504),
       (190, 'Darkmoon Deck: Dominion', 'Neck', 1890, 'Strength', 1015, 'Critical Strike', 1296, 'Haste', NULL, True, 36780),
       (191, 'Memento of Angerboda', 'Neck', 1933, 'Agility', 1544, 'Versatility', 1544, 'Mastery', NULL, True, 35327),
       (192, 'Chaos Talisman', 'Neck', 1877, 'Stamina', 1834, 'Haste', 1834, 'Mastery', NULL, True, 35359),
       (193, 'Hunger of the Pack', 'Neck', 1933, 'Strength', 1834, 'Critical Strike', 1834, 'Haste', NULL, True, 36407),
       (194, 'Arans''s Relaxing Ruby', 'Neck', 2500, 'Agility', 1968, 'Mastery', 2286, 'Versatility', NULL, True, 47961),
       (195, 'Helm of Lochness', 'Head', 3000, 'Strength', 2523, 'Mastery', 2523, 'Versatility', 'Plate', True, 50467),
       (196, 'Mantle of Highrock', 'Shoulder', 2566, 'Strength', 1795, 'Critical Strike', 2057, 'Haste', 'Plate', True, 40789),
       (197, 'Robes of The Magi', 'Chest', 1745, 'Intellect', 1388, 'Versatility', 1388, 'Mastery', 'Cloth', True, 29518),
       (198, 'Thief''s Hands', 'Hands', 1344, 'Agility', 890, 'Haste', 890, 'Critical Strike', 'Leather', True, 10500),
       (199, 'Pant''s of the Swift', 'Legs', 2712, 'Stamina', 2066, 'Haste', 2189, 'Versatility', 'Leather', True, 25900),
       (200, 'Foundation of Stone', 'Feet', 1989, 'Strength', 1344, 'Mastery', 1344, 'Versatility', 'Plate', True, 19750),
       (201, 'Whisper of the Nathrezim', 'Chest', 3915, 'Strength', 3591, 'Critical Strike', 3328, 'Haste', 'Plate', True, 66744),
       (202, 'Liadrin''s Fury Unleashed', 'Neck', 2915, 'Stamina', 2613, 'Critical Strike', 2385, 'Haste', NULL, True, 57646),
       (203, 'Aggramar''s Stride', 'Feet', 4553, 'Strength', 4437, 'Haste', 3788, 'Mastery', 'Plate', True, 70659),
       (204, 'Aegisjalmur, the Armguards of Awe', 'Wrist', 2915, 'Intellect', 1525, 'Critical Strike', 1394, 'Mastery', 'Plate', True, 46769),
       (205, 'Chestplate of Impenetrable Darkness', 'Chest', 4056, 'Intellect', 3839, 'Haste', 3594, 'Mastery', 'Plate', True, 61268),
       (206, 'Terrorbound Nexus', 'Neck', 2086, 'Intellect', 1043, 'Mastery', 1043, 'Critical Strike', NULL, True, 36283),
       (207, 'Chrono Shard', 'Neck', 1631, 'Intellect', 1455, 'Haste', 1455, 'Versatility', NULL, True, 34420)
on conflict do nothing;

insert into "set" (set_id, name, set_bonus)
values (1, 'Shackled Elements', 'Increase the Critical Strike chance of Lightning Bolt by 10 percent'), /* only wearable by shaman */
       (2, 'Enveloped Dissonance', 'Ironskin Brew increases your stagger amount by an additional 5 percent'), /* only wearable by monks */
       (3, 'Doomblade', 'Mutilate can cause the target to bleed an additional 30 percent over 6 seconds'), /* only wearable by rouges */
       (4, 'Robert''s Body', 'You shall become the awesomeness that is Robert!'),
       (5, 'Casey''s Body', 'Become Master of all TA''s')
on conflict do nothing;

insert into set_gear (set_id, gear_id)
values (1, 136),(1, 137),(1, 138),(1, 139),(1, 140),(1, 141),
       (2, 142),(2, 143),(2, 144),(2, 145),(2, 146),(2, 147),
       (3, 148),(3, 149),(3, 150),(3, 151),(3, 152),(3, 153),
       (4, 155),(4, 156),(4, 157),(4, 158),(4, 159),(4, 160),
       (5, 161),(5, 162),(5, 163),(5, 164),(5, 165),(5, 166)
on conflict do nothing;

insert into spec_set (spec_id, set_id)
values (26, 1),
       (14, 2),
       (23, 3)
on conflict do nothing;

insert into location (id, loc_type, map_region)
values (1, 'Dungeon', 'Highmountain'),
       (2, 'Dungeon', 'Azsuna'),
       (3, 'Dungeon', 'Suramar'),
       (4, 'Dungeon', 'Stormheim'),
       (5, 'Dungeon', 'Val''Sharah'),
       (6, 'Vendor', 'The Broken Shore'),
       (7, 'Dungeon', 'Dalaran'),
       (8, 'Dungeon', 'Val''Sharah'),
       (9, 'Dungeon', 'Stormheim'),
       (10, 'Dungeon', 'Suramar'),
       (11, 'Dungeon', 'Azsuna'),
       (12, 'Raid', 'Val''Sharah'),
       (13, 'Raid', 'Stormheim'),
       (14, 'Raid', 'Suramar'),
       (15, 'Vendor', 'Dalaran'),
       (16, 'Vendor', 'Suramar'),
       (17, 'Vendor', 'Azsuna'),
       (18, 'Vendor', 'Stormheim')
on conflict do nothing;

insert into dungeon (id, dungeon_name)
values (5, 'Black Rook Hold'),
       (3, 'Court of Stars'),
       (2, 'Eye of Azshara'),
       (4, 'Halls of Valor'),
       (8, 'Darkheart Thicket'),
       (9, 'Maw of Souls'),
       (1, 'Neltharion''s Lair'),
       (10, 'The Arcway'),
       (11, 'Vault of the Wardens'),
       (7, 'Violet Hold')
on conflict do nothing;

insert into raid (id, raid_name)
values (12, 'Emerald Nightmare'),
       (13, 'Trial of Valor'),
       (14, 'The Nighthold')
on conflict do nothing;

insert into vendor (id, first_name, surname)
values (15, 'Frank', 'Null'),
       (6, 'Casey', 'Poole'),
       (16, 'Julie', 'Thorton'),
       (17, 'Aaron', 'Schif'),
       (18, 'Robert', 'Stewart')
on conflict do nothing;

--insert into gear_location (gear_id, location_id)
--values ()
--on conflict do nothing;

insert into bosses (boss_id, name)
values (1, 'Amalgam of Souls'),
       (2, 'Illysanna Ravencrest'),
       (3, 'Smashspite the Hateful'),
       (4, 'Lord Kur''talos Ravencrest'),
       (5, 'Patrol Captain Gerdo'),
       (6, 'Talixae Flamewreath'),
       (7, 'Advisor Melandrus'),
       (8, 'Warlord Parjesh'),
       (9, 'Lady Hatecoil'),
       (10, 'Serpentrix'),
       (11, 'King Deepbeard'),
       (12, 'Wrath of Azshara'),
       (13, 'Hymdall'),
       (14, 'Hyrja'),
       (15, 'Fenryr'),
       (16, 'God-King Skovald'),
       (17, 'Odyn'),
       (18, 'Ymiron'),
       (19, 'Harbaron'),
       (20, 'Helya'),
       (21, 'Archdruid Glaidalis'),
       (22, 'Oakheart'),
       (23, 'Dresaron'),
       (24, 'Shade of Xavius'),
       (25, 'Rokmora'),
       (26, 'Ularogg Cragshaper'),
       (27, 'Naraxas'),
       (28, 'Dargrul'),
       (29, 'Ivanyr'),
       (30, 'Corstilax'),
       (31, 'General Xakal'),
       (32, 'Nal''tira'),
       (33, 'Advisor Vandros'),
       (34, 'Ursoc'),
       (35, 'Nythendra'),
       (36, 'Dragons of Nightmare'),
       (37, 'Xavius'),
       (38, 'I''lgynoth'),
       (39, 'Elerethe Renferal'),
       (40, 'Cenarius'),
       (41, 'Odyn (raid-boss)'),
       (42, 'Guarm'),
       (43, 'Helya (raid-boss)'),
       (44, 'Latosius'),
       (45, 'Erekem'),
       (46, 'Moragg'),
       (47, 'Ichoron'),
       (48, 'Xevozz'),
       (49, 'Lavanthor'),
       (50, 'Zuramat the Obliterator'),
       (51, 'Cyanigosa'),
       (52, 'Tirathon Saltheril'),
       (53, 'Inquisitor Tormentorum'),
       (54, 'Glazer'),
       (55, 'Ash''Golm'),
       (56, 'Cordana Felsong'),
       (57, 'Skorpyron'),
       (58, 'Krosus'),
       (59, 'Chronomatic Anomaly'),
       (60, 'Trilliax'),
       (61, 'Star Augur Etraeus'),
       (62, 'Gul''dan'),
       (63, 'Grand Magistrix Elisande'),
       (64, 'Spellblade Aluriel'),
       (65, 'High Botanist Tel''arn'),
       (66, 'Tichondrius')
on conflict do nothing;

insert into boss_dungeon (dungeon_id, boss_id)
    values (1, 25),(1, 26),(1, 27),(1, 28),
           (2, 8),(2, 9),(2, 10),(2, 11),(2, 12),
           (3, 5),(3, 6),(3, 7),
           (4, 13),(4, 14),(4, 15),(4, 16),(4, 17),
           (5, 1),(5, 2),(5, 3),(5, 4),(5, 44),
           (7, 45),(7, 46),(7, 47),(7, 48),(7, 49),(7, 50),(7, 51),
           (8, 21),(8, 22),(8, 23),(8, 24),(9, 18),(9, 19),(9, 20),
           (10, 29),(10, 30),(10, 31),(10, 32),(10, 33),
           (11, 52),(11, 53),(11, 54),(11, 55),(11, 56)
on conflict do nothing;

insert into boss_raid (raid_id, boss_id)
    values (12, 34),(12, 35),(12, 36),(12, 37),(12, 38),(12, 39),(12, 40),
           (13, 41),(13, 42),(13, 43),
           (14, 57),(14, 58),(14, 59),(14, 60),(14, 61),(14, 62),(14, 63),(14, 64),(14, 65),(14, 66)
on conflict do nothing;

insert into boss_gear (boss_id, gear_id)
    values (1, 1),(1, 2),(1, 3),(1, 4),
           (2, 5),(2, 6),(2, 7),
           (3, 8),(3, 9),(3, 10),(3,11),
           (4, 12),(4, 13),(4, 13),
           (5, 15),(5, 16),(5, 17),
           (6, 18),(6, 19),(6, 20),
           (7, 21),(7, 22),
           (8, 23),(8, 24),
           (9, 25),(9, 26),(9, 27),
           (10, 28),(10, 29),(10, 30),
           (11, 31),(11, 32),(11, 33),
           (12, 34),(12, 35),(12, 36), (12, 37),
           (13, 38),(13, 39),(13, 40), (13, 41),
           (14, 42),(14, 43),(14, 44),
           (15, 45),(15, 46),(15, 47),
           (16, 48),(16, 49),(16, 50),
           (17, 51),(17, 52),(17, 53),(17, 54),(17, 55),
           (18, 56),(18, 57),(18, 58),
           (19, 59),(19, 60),(19, 61),
           (20, 62),(20, 63),(20, 64),
           (21, 65),(21, 66),(21, 67),
           (22, 68),(22, 69),(22, 70),
           (23, 71),(23, 72),(23, 73),
           (24, 75),(24, 76),(24, 77),
           (25, 78),(25, 79),(25, 80),
           (26, 81),(26, 82),(26, 83),
           (27, 84),(27, 85),(27, 86),
           (28, 87),(28, 88),(28, 89),(28, 90),
           (29, 91),(29, 92),(29, 93),
           (30, 94),(30, 95),(30, 96),
           (31, 97),(31, 98),(31, 99),
           (32, 100),(32, 101),(32, 102),
           (33, 103),(33, 104),(33, 105),
           (34, 106),(34, 107),(34, 108),
           (35, 109),(35, 110),(35, 111),
           (36, 112),(36, 113),(36, 114),
           (37, 115),(37, 116),(37, 117),
           (38, 118),(38, 119),(38, 120),
           (39, 121),(39, 122),(39, 123),
           (40, 124),(40, 125),(40, 126),
           (41, 127),(41, 128),(41, 129),
           (42, 130),(42, 131),(42, 132),
           (43, 133),(43, 134),(43, 135)
on conflict do nothing;

insert into "user" (id, username, password)
    values (1, 'dummy', 'password');

select pop_spec_gear();
select pop_vendor_gear();
