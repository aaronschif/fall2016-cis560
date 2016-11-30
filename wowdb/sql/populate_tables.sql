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
   I used NULL to represent these

   I put notes next to each insert value to note where they come from.
 */
insert into gear (id, name, slot, primary_stat, secondary_stat_1, secondary_stat_2, material, tradable)
values (1, 'Rook Footman''s Warboots', 'Feet', '556 Strength', '243 Critical Strike', '233 Haste', 'Plate', False), /* Black Rook Hold, Amalgam of Souls */
       (2, 'Shadowfeather Shawl', 'Back', '417 Agility', '389 Haste', '401 Mastery', NULL, False), /* Black Rook Hold, Amalgam of Souls */
       (3, 'Etheldrin''s Breastplate', 'Chest', '742 Strength', '705 Mastery', '834 Critical Strike', 'Plate', False), /* Black Rook Hold, Amalgam of Souls */
       (4, 'Ravencourt Formal Robes', 'Chest', '742 Intellect', '367 Critical Strike', '355 Versatility', 'Cloth', False), /* Black Rook Hold, Amalgam of Souls */
       (5, 'Soulstarve Hood', 'Head', '742 Agility', '599 Haste', '607 Mastery', 'Leather', False), /* Black Rook Hold, Illysanna Ravencrest */
       (6, 'Soul-Torn Fury Cinch', 'Waist', '556 Intellect', '259 Critical Strike', '204 Versatility', 'Mail', False), /* Black Rook Hold, Illysanna Ravencrest */
       (7, 'Slippers of Heedless Sacrifice', 'Feet', '556 Intellect', '275 Haste', '301 Critical Strike', 'Cloth', False), /* Black Rook Hold, Illysanna Ravencrest */
       (8, 'Leadfoot Earthshakers', 'Feet', '556 Strength', '227 Versatility', '237 Mastery', 'Plate', False), /* Black Rook Hold, Smashspite the Hateful */
       (9, 'Shorn Batbrood Cuffs', 'Wrist', '417 Agility', '397 Critical Strike', '405 Haste', 'Leather', False), /* Black Rook Hold, Smashspite the Hateful */
       (10, 'Felbat Leather Vest', 'Chest', '742 Agility', '670 Critical Strike', '699 Mastery', 'Leather', False), /* Black Rook Hold, Smashspite the Hateful */
       (11, 'Mardum Chain Vest', 'Chest', '742 Intellect', '388 Versatility', '378 Haste', 'Mail', False), /* Black Rook Hold, Smashspite the Hateful */
       (12, 'Drape of the Raven Lord', 'Back', 'Strength', '198 Haste', '357 Mastery', NULL, False), /* Black Rook Hold, Lord Ravencrest */
       (13, 'Legguards of Endless Horrors', 'Legs', '742 Agility', '664 Haste', '324 Versatility', 'Leather', False), /* Black Rook Hold, Lord Ravencrest */
       (14, 'Ravencrest''s Unerring Striders', 'Feet', '556 Intellect', '497 Haste', '243 Mastery', 'Mail', False), /* Black Rook Hold, Lord Ravencrest */
       (15, 'Arcanist''s Resonant Robes', 'Chest', '1182 Intellect', '763 Haste', '494 Mastery', 'Cloth', False), /* Court of stars, Patrol Captain Gerdo */
       (16, 'Manawracker Sandals', 'Feet', '886 Intellect', '289 Haste', '653 Mastery', 'Cloth', False), /* Court of stars, Patrol Captain Gerdo */
       (17, 'Guileful Intruder Handguards', 'Hands', '886 Agility', '653 Critical Strike', '289 Haste', 'Leather', False), /* Court of stars, Patrol Captain Gerdo */
       (18, 'Chain of Scorched Bones', 'Neck', '997 Stamina', '1163 Haste', '606 Versatility', NULL, False), /* Court of stars, Talixae Flamewreath */
       (19, 'Felbat Leather Pauldrons', 'Shoulder', '886 Agility', '552 Critical Strike', '391 Versatility', 'Leather', False), /* Court of stars, Talixae Flamewreath */
       (20, 'Inferno Breastplate', 'Chest', '1182 Intellect', '494 Critical Strike', '763 Haste', 'Plate', False), /* Court of stars, Talixae Flamewreath */
       (21, 'Veil of Unseen Strikes', 'Head', '1182 Agility', '440 Versatility', '817 Mastery', 'Leather', False), /* Court of stars, Advisor Melandrus */
       (22, 'Suramar Magistrate Leggings', 'Legs', '1182 Intellect', '844 Haste', '413 Versatility', 'Cloth', False), /* Court of stars, Advisor Melandrus */
       (23, 'Seawitch Gloves', 'Hands', '556 Intellect', '291 Versatility', '450 Mastery', 'Cloth', False), /* Eye of Azshara, Warlord Parjesh */
       (24, 'Coralplate Chestguard', 'Chest', '742 Strength', '324 Versatility', '663 Mastery', 'Plate', False), /* Eye of Azshara, Warlord Parjesh */
       (25, 'Brinewashed Leather Pant', 'Legs', '742 Intellect', '367 Versatility', '620 Mastery', 'Leather', False), /* Eye of Azshara, Lady Hatecoil */
       (26, 'Horizon Line Warboots', 'Feet', '556 Strength', '497 Critical Strike', '242 Haste', 'Plate', False), /* Eye of Azshara, Lady Hatecoil */
       (27, 'Cord of the Sea-Caller', 'Waist', '556 Intellect', '242 Haste', '497 Versatility', 'Cloth', False), /* Eye of Azshara, Lady Hatecoil */
       (28, 'Tunic of the Pitiless Monstrosity', 'Chest', '742 Agility', '282 Critical Strike', '705 Mastery', 'Leather', False), /* Eye of Azshara, Serpentrix */
       (29, 'Coralplate Pauldrons', 'Shoulder', '556 Strength', '275 Versatility', '466 Mastery', 'Plate', False), /* Eye of Azshara, Serpentrix */
       (30, 'Brinewashed Leather Grips', 'Hands', '556 Intellect', '307 Versatility', '434 Mastery', 'Leather', False), /* Eye of Azshara, Serpentrix */
       (31, 'Taut Halyard Waistband', 'Waist', '556 Agility', '513 Haste', '227 Versatility', 'Leather', False), /* Eye of Azshara, King Deepbeard */
       (32, 'Rising Ocean Legwraps', 'Legs', '742 Intellect', '409 Critical Strike', '578 Mastery', 'Cloth', False), /* Eye of Azshara, King Deepbeard */
       (33, 'Keelhauler Legplates', 'Legs', '742 Strength', '367 Critical Strike', '620 Haste', 'Plate', False), /* Eye of Azshara, King Deepbeard */
       (34, 'Thundercrush Pauldrons', 'Shoulder', '556 Agility', '291 Haste', '450 Mastery', 'Mail', False), /* Eye of Azshara, Wrath of Azshara */
       (35, 'Stormcharged Choker', 'Neck', '626 Stamina', '952 Critical Strike', '436 Mastery', NULL, False), /* Eye of Azshara, Wrath of Azshara */
       (36, 'Slippers of Martydom', 'Feet', '556 Intellect', '513 Haste', '227 Mastery', 'Cloth', False), /* Eye of Azshara, Wrath of Azshara */
       (37, 'Brinewashed Leather Boots', 'Feet', '556 Agility', '243 Versatility', '497 Mastery', 'Leather', False), /* Eye of Azshara, Wrath of Azshara */
       (38, 'Biornskin Leggings', 'Legs', '742 Intellect', '599 Critical Strike', '388 Mastery', 'Leather', False), /* Halls of Valor, Hymdall */
       (39, 'Bonespeaker Cowl', 'Head', '742 Intellect', '684 Critical Strike', '303 Mastery', 'Cloth', False), /* Halls of Valor, Hymdall */
       (40, 'Skoldiir Breastplate', 'Chest', '742 Intellect', '620 Critical Strike', '367 Mastery', 'Plate', False), /* Halls of Valor, Hymdall */
       (41, 'Cushioned Treads of Glory', 'Feet', '556 Intellect', '291 Haste', '450 Mastery', 'Cloth', False), /* Halls of Valor, Hymdall */
       (42, 'Tideskin Gauntlets', 'Hands', '556 Agility', '513 Critical Strike', '227 Mastery', 'Mail', False), /* Halls of Valor, Hyrja */
       (43, 'Thunderfused Val''kyr Hauberk', 'Chest', '742 Agility', '303 Haste', '684 Mastery', 'Mail', False), /* Halls of Valor, Hyrja */
       (44, 'Valkyra Protector Greatboots', 'Feet', '556 Strength', '481 Haste', '259 Mastery', 'Plate', False), /* Halls of Valor, Hyrja */
       (45, 'Silken Bloodscent Gloves', 'Hands', '556 Intellect', '481 Critical Strike', '259 Haste', 'Cloth', False), /* Halls of Valor, Fenryr */
       (46, 'Runebands of the worthy', 'Wrist', '417 Intellect', '182 Critical Strike', '373 Haste', 'Mail', False), /* Halls of Valor, Fenryr */
       (47, 'Hide of Fenryr', 'Chest', '742 Agility', '578 Haste', '409 Mastery', 'Leather', False), /* Halls of Valor, Fenryr */
       (48, 'Infernal Mantle of Conquest', 'Shoulder', '556 Intellect', '227 Haste', '513 Mastery', 'Cloth', False), /* Halls of Valor, God-King Skavald */
       (49, 'Skoldiir Helm', 'Head', '742 Strength', '684 Critical Strike', '303 Mastery', 'Plate', False), /* Halls of Valor, God-King Skavald */
       (50, 'Felstep Footguards', 'Feet', '556 Intellect', '212 Critical Strike', '529 Mastery', 'Mail', False), /* Halls of Valor, God-King Skavald */
       (51, 'Cape of Valarjar Courage', 'Back', '417 Strength', '278 Versatility', '278 Mastery', NULL, False), /* Halls of Valor, Odyn */
       (52, 'Pauldrons of the All-Father', 'Shoulder', '556 Strength', '434 Haste', '307 Mastery', 'Plate', False), /* Halls of Valor, Odyn */
       (53, 'Wristbands of Magnificent Splendor', 'Wrist', '417 Intellect', '206 Critical Strike', '349 Versatility', 'Plate', False), /* Halls of Valor, Odyn */
       (54, 'Treads of Light', 'Feet', '556 Intellect', '275 Critical Strike', '466 Versatility', 'Cloth', False), /* Halls of Valor, Odyn */
       (55, 'Solid Gold Bracelets', 'Wrist', '417 Agility', '337 Critical Strike', '218 Versatility', 'Mail', False), /* Halls of Valor, Odyn */
       (56, 'Crown of Fallen Kings', 'Head', '742 Strength', '705 Critical Strike', '282 Mastery', 'Plate', False), /* Maw of Souls, Ymiron */
       (57, 'Biornskin Belt', 'Waist', '556 Intellect', '434 Critical Strike', '307 Mastery', 'Leather', False), /* Maw of Souls, Ymiron */
       (58, 'Tideskorn Sabatons', 'Feet', '556 Agility', '434 Critical Strike', '307 Mastery', 'Mail', False), /* Maw of Souls, Ymiron */
       (59, 'Skoldiir Legguards', 'Legs', '742 Strength', '684 Critical Strike', '303 Mastery', 'Plate', False), /* Maw of Souls, Harbaron */
       (60, 'Void-Touched Wristplates', 'Wrist', '417 Intellect', '397 Haste', '159 Mastery', 'Plate', False), /* Maw of Souls, Harbaron */
       (61, 'Soul-Stitched Robes', 'Chest', '742 Intellect', '578 Versatility', '409 Mastery', 'Cloth', False), /* Maw of Souls, Harbaron */
       (62, 'Belt of Eternal Torment', 'Waist', '556 Intellect', '212 Haste', '529 Mastery', 'Cloth', False), /* Maw of Souls, Helya */
       (63, 'Kraken Hide Helm', 'Head', '742 Agility', '367 Haste', '620 Versatility', 'Leather', False), /* Maw of Souls, Helya */
       (64, 'Salt-Laden Stompers', 'Feet', '556 Intellect', '291 Critical Strike', '450 Versatility', 'Plate', False), /* Maw of Souls, Helya */
       (65, 'Thornscar Wristguards', 'Wrist', '417 Strength', '194 Critical Strike', '361 Mastery', 'Plate', False), /* Darkheart Thicket, Archdruid Glaidalis */
       (66, 'Tranquil Bough Vest', 'Chest', '742 Agility', '663 Haste', '324 Mastery', 'Leather', False), /* Darkheart Thicket, Archdruid Glaidalis */
       (67, 'Night Dreamer Crest', 'Head', '742 Intellect', '684 Haste', '303 Mastery', 'Cloth', False), /* Darkheart Thicket, Archdruid Glaidalis */
       (68, 'Breastplate of Preservation', 'Chest', '742 Strength', '684 Critical Strike', '303 Mastery', 'Plate', False), /* Darkheart Thicket, Oakheart */
       (69, 'Dreadhide Girdle', 'Waist', '556 Intellect', '434 Critical Strike', '307 Haste', 'Leather', False), /* Darkheart Thicket, Oakheart */
       (70, 'Blighted Grasp Bracers', 'Wrist', '417 Agility', '206 Haste', '349 Versatility', 'Mail', False), /* Darkheart Thicket, Oakheart */
       (71, 'Tranquil Bough Hood', 'Head', '742 Agility', '684 Haste', '303 Mastery', 'Leather', False), /* Darkheart Thicket, Dresaron */
       (72, 'Slipstream Shoulderpads', 'Shoulder', '556 Intellect', '481 Haste', '259 Mastery', 'Cloth', False), /* Darkheart Thicket, Dresaron */
       (73, 'Thermal Bindings', 'Wrist', '417 Intellect', '182 Critical Strike', '373 Mastery', 'Leather', False), /* Darkheart Thicket, Dresaron */
       (75, 'Ashen Satyr Leggings', 'Legs', '742 Agility', '642 Critical Strike', '345 Haste', 'Leather', False), /* Darkheart Thicket, Shade of Xavius */
       (76, 'Dream Bolstered Chestguard', 'Chest', '742 Intellect', '409 Critical Strike', '578 Mastery', 'Mail', False), /* Darkheart Thicket, Shade of Xavius */
       (77, 'Burning Sky Pauldrons', 'Shoulder', '556 Agility', '513 Haste', '227 Mastery', 'Mail', False), /* Darkheart Thicket, Shade of Xavius */
       (78, 'Shoulderbuckle Strap', 'Waist', '556 Agility', '481 Haste', '259 Mastery', 'Mail', False ), /* Neltharion's Lair, Rokmora */
       (79, 'Rivermade Sandals', 'Feet', '556 Intellect', '238 Critical Strike', '503 Haste', 'Leather', False), /* Neltharion's Lair, Rokmora */
       (80, 'Skyhorn Mantle', 'Shoulder', '556 Agility', '275 Critical Strike', '466 Haste', 'Mail', False), /* Neltharion's Lair, Rokmora */
       (81, 'Cragshaper''s Fitted Hood', 'Head', '742 Intellect', '409 Critical Strike', '578 Haste', 'Cloth', False), /* Neltharion's Lair, Ularogg Cragshaper */
       (82, 'Bitestone Wristwrap', 'Wrist', '417 Intellect', '385 Haste', '170 Versatility', 'Mail', False), /* Neltharion's Lair, Ularogg Cragshaper */
       (83, 'Steelgazer Hide Hood', 'Head', '742 Agility', '705 Haste', '282 Versatility', 'Leather', False), /* Neltharion's Lair, Ularogg Cragshaper */
       (84, 'Subterranean Horror Faceguard', 'Head', '742 Intellect', '388 Haste', '599 Mastery', 'Plate', False), /* Neltharion's Lair, Naraxas */
       (85, 'Gauntlets of Innumerable Barbs', 'Hands', '556 Agility', '243 Critical Strike', '497 Mastery', 'Mail', False), /* Neltharion's Lair, Naraxas */
       (86, 'Wristbands of Rousing Violence', 'Wrist', '417 Intellect', '159 Haste', '397 Mastery', 'Leather', False), /* Neltharion's Lair, Naraxas */
       (87, 'Steelgazer Hide Mantle', 'Shoulder', '556 Intellect', '434 Haste', '307 Versatility', 'Leather', False), /* Neltharion's Lair, Dargrul */
       (88, 'Faultline Leggings', 'Legs', '742 Agility', '599 Critical Strike', '338 Nastery', 'Mail', False), /* Neltharion's Lair, Dargrul */
       (89, 'Gloves of the Mountain Conquest', 'Hands', '556 Intellect', '466 Haste', '275 Mastery', 'Cloth', False), /* Neltharion's Lair, Dargrul */
       (90, 'Sinister Ashfall Cord', 'Waist', '556 Agility', '529 Critical Strike', '212 Mastery', 'Leather', False), /* Neltharion's Lair, Dargrul */
       (91, 'Tunnel Trudger Footguards', 'Feet', '886 Intellect', '674 Critical Strike', '269 Haste', 'Leather', False), /* The Arcway, Ivanyr */
       (92, 'Crackling Overcharge Chestguard', 'Chest', '1182 Strength', '763 Critical Strike', '494 Versatility', 'Plate', False), /* The Arcway, Ivanyr */
       (93, 'Arcane Defender''s Belt', 'Waist', '886 Strength', '391 Haste', '552 Mastery', 'Plate', False), /* The Arcway, Ivanyr */
       (94, 'Decontaminated Chain Tunic', 'Chest', '1182 Agility', '817 Critical Strike', '440 Versatility', 'Mail', False), /* The Arcway, Corstilax */
       (95, 'Spaulders of Aberrant Inhibition', 'Shoulder', '886 Intellect', '269 Critical Strike', '674 Mastery', 'Leather', False), /* The Arcway, Corstilax */
       (96, 'Collar of Enclosure', 'Head', '1182 Intellect', '844 Critical Strike', '413 Haste', 'Cloth', False), /* The Arcway, Corstilax */
       (97, 'Legwraps of the Reverberating Shadows', 'Legs', '1182 Intellect', '494 Critical Strike', '763 Haste', 'Cloth', False), /* The Arcway, General Xakal */
       (98, 'Fist of the Legion', 'Hands', '886 Strength', '440 Haste', '613 Mastery', 'Plate', False), /* The Arcway, General Xakal */
       (99, 'Bloodclaw Leggings', 'Legs', '1182 Agility', '817 Haste', '440 Mastery', 'Leather', False), /* The Arcway, General Xakal */
       (100, 'Tunnel Fiend Bracers', 'Wrist', '665 Intellect', '459 Critical Strike', '247 Versatility', 'Cloth', False), /* The Arcway, Nal'tira */
       (101, 'Greathelm of Barbed Chelicerae', 'Head', '1182 Strength', '440 Critical Strike', '817 Mastery', 'Plate', False), /* The Arcway, Nal'tira */
       (102, 'Cloak of the Mana-Spun Silk', 'Back', '665 Strength', '455 Critical Strike', '252 Versatility', NULL, False), /* The Arcway, Nal'tira */
       (103, 'Treads of the Fates Entwined', 'Feet', '666 Intellect', '674 Critical Strike', '269 Mastery', 'Plate', False), /* The Arcway, Advisor Vandros */
       (104, 'Mana-Laced Gloves', 'Hands', '886 Agility', '572 Versatility', '370 Mastery', 'Leather', False), /* The Arcway, Advisor Vandros */
       (105, 'Manawracker Crown', 'Head', '1182 Intellect', '494 Haste', '763 Mastery', 'Cloth', False), /* The Arcway, Advisor Vandros */
       (106, 'Scored Ironclaw Sabatons', 'Feet', '973 Intellect', '615 Critical Strike', '363 Haste', 'Mail', False), /* Emerald Nightmare, Ursoc */
       (107, 'Splotched Bloodfur Leggings', 'Legs', '1297 Agility', '932 Critical Strike', '372 Mastery', 'Leather', False), /* Emerald Nightmare, Ursoc */
       (108, 'Primal Gauntlets of Rage', 'Hands', '973 Strength', '699 Critical Strike', '279 Haste', 'Plate', False), /* Emerald Nightmare, Ursoc */
       (109, 'Lifeless Buckled Girdle', 'Waist', '973 Agility', '406 Versatility', '574 Mastery', 'Leather', False), /* Emerald Nightmare, Nythendra */
       (110, 'Greyed Dragonscale Coif', 'Head', '1297 Intellect', '568 Critical Strike', '736 Mastery', 'Mail', False), /* Emerald Nightmare, Nythendra */
       (111, 'Wristclamps of Mad Dreams', 'Wrist', '729 Strength', '445 Critical Strike', '288 Haste', 'Plate', False), /* Emerald Nightmare, Nythendra */
       (112, 'Horror Inscribed Chestguard', 'Chest', '1297 Intellect', '932 Critical Strike', '372 Haste', 'Plate', False), /* Emerald Nightmare, Dragons of Nightmare */
       (113, 'Cowl of Fright', 'Head', '1297 Agility', '456 Critical Strike', '848 Mastery', 'Leather', False), /* Emerald Nightmare, Dragons of Nightmare */
       (114, 'Malignant Sabatons', 'Feet', '1459 Intellect', '699 Critical Strike', '279 Haste', 'Mail', False), /* Emerald Nightmare, Dragons of Nightmare */
       (115, 'Disjointed Linkage Leggings', 'Legs', '1297 Agility', '512 Critical Strike', '792 Haste', 'Mail', False), /* Emerald Nightmare, Xavius */
       (116, 'Midnight Herald''s Pauldrons', 'Shoulder', '974 Strength', '322 Critical Strike', '658 Haste', 'Plate', False), /* Emerald Nightmare, Xavius */
       (117, 'Maddening Robe of Secrets', 'Chest', '1297 Intellect', '428 Critical Strike', '876 Mastery', 'Cloth', False), /* Emerald Nightmare, Xavius */
       (118, 'Cinch of Cosmic Insignficance', 'Wrist', '729 Intellect', '509 Haste', '225 Mastery', 'Cloth', False), /* Emerald Nightmare, I'lgynoth */
       (119, 'Pauldrons of Shifting Runes', 'Shoulder', '973 Strength', '553 Critical Strike', '426 Versatility', 'Plate', False), /* Emerald Nightmare, I'lgynoth */
       (120, 'Singular Chain Leggings', 'Legs', '1297 Agility', '400 Haste', '904 Mastery', 'Mail', False), /* Emerald Nightmare, I'lgynoth */
       (121, 'Patient Ambusher''s Hauberk', 'Chest', '1297 Intellect', '848 Critical Strike', '456 Mastery', 'Mail', False), /* Emerald Nightmare, Elerethe Renferal */
       (122, 'Pliable Spider Silk Cinch', 'Waist', '973 Intellect', '363 Critical Strike', '615 Mastery', 'Cloth', False), /* Emerald Nightmare, Elerethe Renferal */
       (123, 'Mask of Multitudinous Eyes', 'Head', '1297 Agility', '932 Critical Strike', '372 Versatility', 'Leather', False), /* Emerald Nightmare, Elerethe Renferal */
       (124, 'Forest-Lord''s Waistwrap', 'Waist', '973 Agility', '637 Haste', '342 Mastery', 'Leather', False), /* Emerald Nightmare, Cenarius */
       (125, 'Cozy Dryad Hoof-Socks', 'Feet', '973 Intellect', '322 Critical Strike', '658 Haste', 'Cloth', False), /* Emerald Nightmare, Cenarius */
       (126, 'Fitted Ironbark Gauntlets', 'Hands', '973 Strength', '637 Haste', '342 Mastery', 'Plate', False), /* Emerald Nightmare, Cenarius */
       (127, 'Cinch of Light', 'Waist', '1068 Intellect', '290 Haste', '726 Mastery', 'Cloth', False), /* Trial of Valor, Odyn */
       (128, 'Gloves of Issued Challenge', 'Hands', '1068 Agility', '399 Critical Strike', '617 Mastery', 'Leather', False), /* Trial of Valor, Odyn */
       (129, 'Goldrune Legplates', 'Legs', '1424 Strength', '445 Critical Strike', '910 Mastery', 'Plate', False), /* Trial of Valor, Odyn */
       (130, 'Lead-Soled Seabed Striders', 'Feet', '1068 Intellect', '978 Haste', '765 Mastery', 'Mail', False), /* Trial of Valor, Guarm */
       (131, 'Helbeast Skin Tunic', 'Chest', '1424 Agility', '561 Haste', '794 Versatility', 'Leather', False), /* Trial of Valor, Guarm */
       (132, 'Bite-Resistant Wristclamps', 'Wrist', '801 Intellect', '316 Mastery', '446 Haste', 'Mail', False), /* Trial of Valor, Guarm */
       (133, 'Krakenbone Waistplate', 'Waist', '1119 Strength', '407 Haste', '628 Mastery', 'Plate', False), /* Trial of Valor, Helya */
       (134, 'Oiled Rigger''s Handwraps', 'Hands', '1119 Intellect', '673 Critical Strike', '362 Versatility', 'Cloth', False), /* Trial of Valor, Helya */
       (135, 'Strand of Whelk Shells', 'Waist', '1119 Agility', '606 Haste', '429 Mastery', 'Leather', False), /* Trial of Valor, Helya */
       (136, 'Helm of Shackled Elements', 'Head','1647 Intellect', '778 Mastery', '655 Haste', 'Mail', False), /* Shackled Elements Set */
       (137, 'Pauldrons of Shackled Elements', 'Shoulder', '1228 Intellect', '606 Critical Strike', '468 Versatility', 'Mail', FALSE), /* Shackled Elements Set */
       (138, 'Raiment of Shackled Elements', 'Chest', '1637 Intellect', '594 Critical Strike', '839 Mastery', 'Mail', False), /* Shackled Elements Set */
       (139, 'Gauntlets of Shackled Elements', 'Hands', '1228 Intellect', '491 Critical Strike', '583 Haste', 'Mail', False), /* Shackled Elements Set */
       (140, 'Creeping of Shackled Elements', 'Waist', '973 Intellect', '637 Haste', '491 Critical Strike', 'Mail', True), /* Shackled Elements Set */
       (141, 'Leggings of Shackled Elements', 'Legs', '1637 Intellect', '532 Versatility', '901 Mastery', 'Mail', True) /* Shackled Elements Set */
on conflict do nothing;

/* order of gear is: Head, Shoulder, Chest, Hands, Waist, Legs */
insert into "set" (set_id, name, set_item_1, set_item_2, set_item_3, set_item_4, set_item_5, set_item_6, set_bonus)
values (1, 'Shackled Elements', 136, 137, 138, 139, 140, 141, 'Increase the Critical Strike chance of Lightning Bolt by 10 percent')
on conflict do nothing;

insert into specialization_gear (specialization_id, gear_id)
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
values (5, 'Black Rook Hold', 'Amalgam of Souls'),
       (5, 'Black Rook Hold', 'Illysanna Ravencrest'),
       (5, 'Black Rook Hold', 'Smashspite the Hateful'),
       (5, 'Black Rook Hold', 'Lord Kur''talos Ravencrest'),
       (3, 'Court of Stars', 'Patrol Captain Gerdo'),
       (3, 'Court of Stars', 'Talixae Flamewreath'),
       (3, 'Court of Stars', 'Adisor Melandrus'),
       (2, 'Eye of Azshara', 'Serpentrix'),
       (2, 'Eye of Azshara', 'Warlord Parjesh'),
       (2, 'Eye of Azshara', 'Lady Hatecoil'),
       (2, 'Eye of Azshara', 'King Deepbeard'),
       (2, 'Eye of Azshara', 'Wrath of Azshara'),
       (4, 'Halls of Valor', 'Hymdall'),
       (4, 'Halls of Valor', 'Hyrja'),
       (4, 'Halls of Valor', 'Fenryr'),
       (4, 'Halls of Valor', 'God-King Skovald'),
       (4, 'Halls of Valor', 'Odyn'),
       (5, 'Darkheart Thicket', 'Archdruid Glaidalis'),
       (5, 'Darkheart Thicket', 'Oakheart'),
       (5, 'Darkheart Thicket', 'Dresaron'),
       (5, 'Darkheart Thicket', 'Shade of Xavius'),
       (4, 'Maw of Souls', 'Ymiron'),
       (4, 'Maw of Souls', 'Harbaron'),
       (4, 'Maw of Souls', 'Helya'),
       (1, 'Neltharion''s Lair', 'Rokmora'),
       (1, 'Neltharion''s Lair', 'Ularogg Cragshaper'),
       (1, 'Neltharion''s Lair', 'Naraxas'),
       (1, 'Neltharion''s Lair', 'Dargrul the Underking'),
       (3, 'The Arcway', 'Ivanyr'),
       (3, 'The Arcway', 'Corstilax'),
       (3, 'The Arcway', 'General Xakal'),
       (3, 'The Arcway', 'Nal''tira'),
       (3, 'The Arcway', 'Advisor Vandros'),
       (2, 'Vault of the Wardens', 'Tirathon Saltheril'),
       (2, 'Vault of the Wardens', 'Ash''golm'),
       (2, 'Vault of the Wardens', 'Glazer'),
       (2, 'Vault of the Wardens', 'Cordana Felsong'),
       (2, 'Vault of the Wardens', 'Inquisitor Tormentorum'),
       (7, 'Violet Hold', 'Erekem'),
       (7, 'Violet Hold', 'Moragg'),
       (7, 'Violet Hold', 'Ichoron'),
       (7, 'Violet Hold', 'Xevozz'),
       (7, 'Violet Hold', 'Lavanthor'),
       (7, 'Violet Hold', 'Zuramat the Obliterator'),
       (7, 'Violet Hold', 'Cyanigosa')
on conflict do nothing;

insert into raid (id, raid_name, boss)
values (5, 'Emerald Nightmare', 'Ursoc'),
       (5, 'Emerald Nightmare', 'Nythendra'),
       (5, 'Emerald Nightmare', 'Dragons of Nightmare'),
       (5, 'Emerald Nightmare', 'Xavius'),
       (5, 'Emerald Nightmare', 'I''lgynoth'),
       (5, 'Emerald Nightmare', 'Elerethe Renferal'),
       (5, 'Emerald Nightmare', 'Cenarius'),
       (4, 'Trial of Valor', 'Odyn'),
       (4, 'Trial of Valor', 'Guarm'),
       (4, 'Trial of Valor', 'Helya'),
       (3, 'The Nighthold', 'Skorpyron'),
       (3, 'The Nighthold', 'Chronomatic Anomaly'),
       (3, 'The Nighthold', 'Trilliax'),
       (3, 'The Nighthold', 'Spellblade Aluriel'),
       (3, 'The Nighthold', 'High Botanist Tel''am'),
       (3, 'The Nighthold', 'Star Augur Etraeus'),
       (3, 'The Nighthold', 'Tichondrius'),
       (3, 'The Nighthold', 'Krosus'),
       (3, 'The Nighthold', 'Grand Magistrix Elisande'),
       (3, 'The Nighthold', 'Gul''dan')
on conflict do nothing;

insert into vendor (id, first_name, surname, price)
values (4, 'casey', 'poole', '2')
on conflict do nothing;

insert into gear_location (gear_id, location_id)
values ()
on conflict do nothing;