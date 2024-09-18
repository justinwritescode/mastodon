# frozen_string_literal: true

# db/seeds.rb
if FieldTemplate.all.blank?
  FieldTemplate.create([
                         { name: 'build', dropdown: true, description: '{{possessive}} build/body type' },
                         { name: 'cock girth', dropdown: true, description: 'how thick around {{possessive}} cock is; its circumference, in inches' },
                         { name: 'cock length', dropdown: true, description: 'how long {{possessive}} cock is, measured from the base along the top, in inches' },
                         { name: 'dominance', dropdown: true, description: 'how "dominant" {{be}} {{subject}} in the sack (or dungeon)?' },
                         { name: 'drinker', dropdown: true, description: '{{possessive}} habits with alcohol' },
                         { name: 'drug use', dropdown: true, description: '{{possessive}} habits as they relate to recreational drug usage' },
                         { name: 'drugs of choice', dropdown: false, description: 'when/if {{subject}} {{verb:use}} recreational drugs, which one(s) {{do}} {{subject}} use?', multiple: true },
                         { name: 'hair color', dropdown: true, description: 'what color is {{possessive}} hair?' },
                         { name: 'hair length/style', dropdown: true, description: '{{possessive}} hair length/style' },
                         { name: 'hiv status', dropdown: true, description: '{{possessive}} HIV status' },
                         { name: 'kinks/fetishes', dropdown: false, description: 'the fuck {{be}} {{subject}} into, BBro?' },
                         { name: 'location', dropdown: false, description: '{{possessive}} current location (city, state)' },
                         { name: 'race', dropdown: true, description: '{{possessive}} racial makeup', multiple: true },
                         { name: 'sexual role', dropdown: true, description: '{{do}} {{subject}} prefer the top or the bottom bunk?' },
                         { name: 'smoker', dropdown: true, description: '{{do}} {{subject}} use cigarettes?' },
                         { name: 'body hair', dropdown: true, description: 'how hairy {{be}} {{subject}}?' },
                         { name: 'height', dropdown: true, description: 'how tall {{be}} {{subject}}?' },
                         { name: 'weight', dropdown: true, description: 'how much {{do}} {{subject}} weigh?' },
                       ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'location').id).blank?
  FieldTemplate.find_or_create_by(name: 'location').field_values.create([{ display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t entered {{possessive}} location (yet)',
                                                                           default: true }])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'hiv status').id).blank?
  FieldTemplate.find_or_create_by(name: 'hiv status').field_values.create([
                                                                            { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t entered a value for {{possessive}} HIV status', default: true },
                                                                            { display_value: '???', value: 0, description: 'an unknown HIV status' },
                                                                            { display_value: 'neg (chasing)', value: -1000, description: 'HIV-negative, actively chasing HIV' },
                                                                            { display_value: 'neg (on PrEP)', value: -100, description: 'HIV-negative, on pre-exposure prophylaxis' },
                                                                            { display_value: 'neg', value: -1, description: 'HIV-negative' },
                                                                            { display_value: 'poz (undetectable)', value: 1, description: 'HIV-positive, on medication, with an undetectable viral load' },
                                                                            { display_value: 'poz (toxic)', value: 1000, description: 'HIV-positive, not on medication, with a "toxic" viral load' },
                                                                            { display_value: 'poz', value: 10, description: 'HIV-positive' },
                                                                            { display_value: 'other', value: 9999, description: 'Some other status not otherwise listed' },
                                                                          ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'sexual role').id).blank?
  FieldTemplate.find_or_create_by(name: 'sexual role').field_values.create([
                                                                             { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a sexual role (yet)', default: true },
                                                                             { display_value: 'total bottom', value: -4, description: 'Never {{verb:put}} {{possessive}} dick in another man\'s ass; {{possessive}} dick is only for show or to flop around whilst {{subject}} {{verb:get}} railed' },
                                                                             { display_value: 'bottom', value: -3, description: '{{subject}} can top in an emergency' },
                                                                             { display_value: 'mostly bottom', value: -2, description: '{{subject}}\'ll top for the right guy' },
                                                                             { display_value: 'vers bottom', value: -1, description: '{{subject}} {{be}} predominantly bottom, but will top on occasion' },
                                                                             { display_value: 'versatile', value: 0, description: '{{subject}}  {{verb:enjoy}} both fucking and getting fucked equally' },
                                                                             { display_value: 'vers top', value: 1, description: '{{subject}} predominantly a top, but {{verb:enjoy}} bottoming on occasion' },
                                                                             { display_value: 'mostly top', value: 2, description: '{{subject}}\'ll bottom for the right guy' },
                                                                             { display_value: 'top', value: 3, description: '{{subject}}\' bottom on rare occasions' },
                                                                             { display_value: 'total top', value: 4, description: '{{subject}} {{be}} a total top; no dick goes in {{possessive}} ass EVER' },
                                                                           ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'hair length/style').id).blank?
  FieldTemplate.find_or_create_by(name: 'hair length/style').field_values.create([
                                                                                   { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a hair style (yet)', default: true },
                                                                                   { display_value: 'short', value: 1, description: 'short' },
                                                                                   { display_value: 'military', value: 2, description: 'military/crew cut' },
                                                                                   { display_value: 'bald', value: 3, description: 'bald/shaved' },
                                                                                   { display_value: 'medium', value: 4, description: 'medium length hair' },
                                                                                   { display_value: 'long', value: 5, description: 'like a chick\'s' },
                                                                                 ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'hair color').id).blank?
  FieldTemplate.find_or_create_by(name: 'hair color').field_values.create([
                                                                            { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a hair color (yet)', default: true },
                                                                            { display_value: 'bald', value: 0, description: 'bald' },
                                                                            { display_value: 'black', value: 1, description: 'black' },
                                                                            { display_value: 'blond', value: 2, description: 'blond' },
                                                                            { display_value: 'brown', value: 3, description: 'brown' },
                                                                            { display_value: 'dark blond', value: 4, description: 'dark blond' },
                                                                            { display_value: 'dark brown', value: 5, description: 'dark brown' },
                                                                            { display_value: 'dyed', value: 6, description: 'dyed' },
                                                                            { display_value: 'gray', value: 7, description: 'gray' },
                                                                            { display_value: 'light blond', value: 8, description: 'light blond' },
                                                                            { display_value: 'light brown', value: 9, description: 'light brown' },
                                                                            { display_value: 'other', value: 10, description: 'some other color' },
                                                                            { display_value: 'red', value: 11, description: 'auburn/red' },
                                                                          ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'build').id).blank?
  FieldTemplate.find_or_create_by(name: 'build').field_values.create([
                                                                       { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a build (yet)', default: true },
                                                                       { display_value: 'skinny', value: 0, description: '{{subject}} {{have}} a skinny/slim build' },
                                                                       { display_value: 'athletic', value: 1, description: '{{subject}} {{have}} an athletic build' },
                                                                       { display_value: 'average', value: 2, description: '{{subject}} {{have}} an average build' },
                                                                       { display_value: 'muscular', value: 3, description: '{{subject}} {{have}} a muscular build' },
                                                                       { display_value: 'heavy-set', value: 4, description: '{{subject}} {{have}} a heavy-set (i.e., fat) build' },
                                                                       { display_value: 'twink', value: 5, description: '{{subject}} {{have}} a skinny smooth twinkish build' },
                                                                       { display_value: 'swimmers', value: 6, description: '{{subject}} {{have}} a skinny athletic swimmers build' },
                                                                       { display_value: 'chub', value: 7, description: '{{subject}} {{have}} a chubby (i.e., fat) build' },
                                                                       { display_value: 'bear', value: 8, description: '{{subject}} {{have}} a bearish build' },
                                                                       { display_value: 'otter', value: 9, description: '{{subject}} {{have}} an otterish (slim and hairy) build' },
                                                                     ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'race').id).blank?
  FieldTemplate.find_or_create_by(name: 'race').field_values.create([
                                                                      { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected a race (yet)', default: true },
                                                                      { display_value: 'white', value: 1, description: '{{possessive}} origins are in the original peoples of Europe' },
                                                                      { display_value: 'black', value: -999_999, description: '{{possessive}} ancestry is from any of the black racial groups of Africa' },
                                                                      { display_value: 'asian', value: -99_999, description: '{{possessive}} ancestry is generally Asian (e.g, Chinese, Korean, Japanese, Mongolian)' },
                                                                      { display_value: '{{possessive}}panic', value: -1, description: '{{possessive}} ancestry is generally from Latin America or Spain' },
                                                                      { display_value: 'american indian / alaskan native', value: -999, description: '{{possessive}} ancestry is ultimately Asian but {{possessive}} ancestors came to the United States before Columbus' },
                                                                      { display_value: 'indian', value: -99, description: '{{possessive}} ancestry is generally from the Indian subcontinent' },
                                                                      { display_value: 'middle eastern', value: -9_999_999, description: '{{possessive}} origins are in the Middle East' },
                                                                      { display_value: 'native hawaiian/pacific islander', value: -10, description: '{{subject}} {{has}} origins in any of the original peoples of Hawaii, Guam, Samoa, or other Pacific Islands (and don\t skimp on the rum!)' },
                                                                      { display_value: 'other', value: 0, description: 'Some other racial makeup' },
                                                                    ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'cock length').id).blank?
  FieldTemplate.find_or_create_by(name: 'cock length').field_values.create([
                                                                             { value: nil, display_value: '[not entered]', description: '{{subject}} {{have}}n\'t selected a cock length (yet)', default: true },
                                                                             { value: 0.5, display_value: '.5', description: '½"' },
                                                                             { value: 1, display_value: '1', description: '1"' },
                                                                             { value: 1.5, display_value: '1.5', description: '1 ½"' },
                                                                             { value: 2, display_value: '2', description: '2"' },
                                                                             { value: 2.5, display_value: '2.5', description: '2 ½"' },
                                                                             { value: 3, display_value: '3', description: '3"' },
                                                                             { value: 3.5, display_value: '3.5', description: '3 ½"' },
                                                                             { value: 4, display_value: '4', description: '4"' },
                                                                             { value: 4.5, display_value: '4.5', description: '4 ½"' },
                                                                             { value: 5, display_value: '5', description: '5"' },
                                                                             { value: 5.5, display_value: '5.5', description: '5 ½"' },
                                                                             { value: 6, display_value: '6', description: '6"' },
                                                                             { value: 6.5, display_value: '6.5', description: '6 ½"' },
                                                                             { value: 7, display_value: '7', description: '7"' },
                                                                             { value: 7.5, display_value: '7.5', description: '7 ½"' },
                                                                             { value: 8, display_value: '8', description: '8"' },
                                                                             { value: 8.5, display_value: '8.5', description: '8 ½"' },
                                                                             { value: 9, display_value: '9', description: '9"' },
                                                                             { value: 9.5, display_value: '9.5', description: '9 ½"' },
                                                                             { value: 10, display_value: '10', description: '10"' },
                                                                             { value: 10.5, display_value: '10.5', description: '10 ½"' },
                                                                             { value: 11, display_value: '11', description: '11"' },
                                                                             { value: 11.5, display_value: '11.5', description: '11 ½"' },
                                                                             { value: 12, display_value: '12', description: '12"' },
                                                                             { value: 12.5, display_value: '12.5', description: '12 ½"' },
                                                                             { value: 9999, display_value: '> 12 ½"', description: '> 12 ½"' },
                                                                           ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'cock girth').id).blank?
  FieldTemplate.find_or_create_by(name: 'cock girth').field_values.create([
                                                                            { value: nil, description: '{{subject}} {{have}}n\'t selected a cock girth (yet)', default: true },
                                                                            { value: 0.5, display_value: '½"', description: '½"' },
                                                                            { value: 0.75, display_value: '¾"', description: '¾"' },
                                                                            { value: 1, display_value: '1"', description: '1"' },
                                                                            { value: 1.25, display_value: '1 ¼"', description: '1 ¼"' },
                                                                            { value: 1.5, display_value: '1 ½"', description: '1 ½"' },
                                                                            { value: 2.75, display_value: '2 ¾"', description: '2 ¾"' },
                                                                            { value: 2, display_value: '2"', description: '2"' },
                                                                            { value: 2.25, display_value: '2 ¼"', description: '2 ¼"' },
                                                                            { value: 2.5, display_value: '2 ½"', description: '2 ½"' },
                                                                            { value: 2.75, display_value: '2 ¾"', description: '2 ¾"' },
                                                                            { value: 3, display_value: '3"', description: '3"' },
                                                                            { value: 3.25, display_value: '3 ¼"', description: '3 ¼"' },
                                                                            { value: 3.5, display_value: '3 ½"', description: '3 ½"' },
                                                                            { value: 3.75, display_value: '3 ¾"', description: '3 ¾"' },
                                                                            { value: 4, display_value: '4"', description: '4"' },
                                                                            { value: 4.25, display_value: '4 ¼"', description: '4 ¼"' },
                                                                            { value: 4.5, display_value: '4 ½"', description: '4 ½"' },
                                                                            { value: 4.75, display_value: '4 ¾"', description: '4 ¾"' },
                                                                            { value: 5, display_value: '5"', description: '5"' },
                                                                            { value: 5.25, display_value: '5 ¼"', description: '5 ¼"' },
                                                                            { value: 5.5, display_value: '5 ½"', description: '5 ½"' },
                                                                            { value: 5.75, display_value: '5 ¾"', description: '5 ¾"' },
                                                                            { value: 6, display_value: '6"', description: '6"' },
                                                                            { value: 6.25, display_value: '6 ¼"', description: '6 ¼"' },
                                                                            { value: 6.5, display_value: '6 ½"', description: '6 ½"' },
                                                                            { value: 6.75, display_value: '6 ¾"', description: '6 ¾"' },
                                                                            { value: 7, display_value: '7"', description: '7"' },
                                                                            { value: 7.25, display_value: '7 ¼"', description: '7 ¼"' },
                                                                            { value: 7.5, display_value: '7 ½"', description: '7 ½"' },
                                                                            { value: 7.75, display_value: '7 ¾"', description: '7 ¾"' },
                                                                            { value: 8, display_value: '8"', description: '8"' },
                                                                            { value: 8.25, display_value: '8 ¼"', description: '8 ¼"' },
                                                                            { value: 8.5, display_value: '8 ½"', description: '8 ½"' },
                                                                            { value: 8.75, display_value: '8 ¾"', description: '8 ¾"' },
                                                                            { value: 9, display_value: '9"', description: '9"' },
                                                                            { value: 9.25, display_value: '9 ¼"', description: '9 ¼"' },
                                                                            { value: 9.5, display_value: '9 ½"', description: '9 ½"' },
                                                                            { value: 9.75, display_value: '9 ¾"', description: '9 ¾"' },
                                                                            { value: 10, display_value: '10"', description: '10"' },
                                                                            { value: 9999, display_value: '> 10"', description: '> 10"' },
                                                                          ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'smoker').id).blank?
  FieldTemplate.find_or_create_by(name: 'smoker').field_values.create([
                                                                        { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected whether {{subject}} {{verb:smoke}}s (yet)', default: true },
                                                                        { display_value: 'yes, heavily', value: -9999, description: '{{subject}} {{verb:smoke}} a lot' },
                                                                        { display_value: 'yes', value: -1000, description: '{{subject}} {{verb:smoke}}' },
                                                                        { display_value: 'socially', value: -10, description: '{{subject}} {{verb:smoke}} when {{subject}}\'s out with friends' },
                                                                        { display_value: 'quitting', value: -0.5, description: '{{subject}} {{be}} trying to quit smoking' },
                                                                        { display_value: 'no', value: 1, description: '{{subject}} {{does}}n\'t smoke' },
                                                                        { display_value: 'fuck no', value: 9999, description: '{{subject}} {{have}} never touched a cigarette in {{possessive}} life' },
                                                                      ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'drinker').id).blank?
  FieldTemplate.find_or_create_by(name: 'drinker').field_values.create([
                                                                         { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected whether {{subject}} drinks alcohol (yet)', default: true },
                                                                         { display_value: 'alcoholic', value: -10_000, description: '{{subject}} {{be}} an alcoholic' },
                                                                         { display_value: 'yes, heavily', value: -1000, description: '{{subject}} {{verb:drink}} a lot' },
                                                                         { display_value: 'yes', value: -100, description: '{{subject}} {{verb:drink}} alcohol' },
                                                                         { display_value: 'socially', value: -10, description: '{{subject}} {{verb:drink}} alcohol when {{subject}}\'s out with friends' },
                                                                         { display_value: 'quitting', value: -1, description: '{{subject}} {{be}} trying to quit drinking' },
                                                                         { display_value: 'no', value: 0, description: '{{subject}} {{does}}n\'t drink alcohol' },
                                                                         { display_value: 'in recovery', value: 100, description: '{{subject}} {{be}} in recovery from alcoholism' },
                                                                         { display_value: 'teetotaler', value: 1000, description: '{{subject}} {{have}} never touched alcohol' },
                                                                       ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'dominance').id).blank?
  FieldTemplate.find_or_create_by(name: 'dominance').field_values.create([
                                                                           { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected how "dominant" {{subject}} is (yet)', default: true },
                                                                           { display_value: 'total faggot', value: 0, description: 'A total submissive faggot.  Not a bone of dominance in its body.  It lives omly to serve at the feet of real Alpha Men.' },
                                                                           { display_value: 'faggot', value: 1,
                                                                             description: 'A faggot that knows its place in t{{possessive}} world is at the feet of real Alpha Men.  No dominance in its body, save for a fleeting glimmer of self-confidence before it comes to its senses and ' \
                                                                                          'remembers its true place and purpose.' },
                                                                           { display_value: 'mostly fag', value: 2, description: 'Mostly a faggot.  Might stand up for itself once in a while but it\'s not comfortable doing it and looks hella dumb trying.' },
                                                                           { display_value: 'sub', value: 3, description: 'Submissive, but not a faggot.  Has some self-respect.  Stands up for himself occasionally and has {{possessive}} own life apart from the Alphas whom {{subject}} serves.' },
                                                                           { display_value: 'switchy sub', value: 4, description: 'Switchy sub.  A switch who leans sub.  Might dom occasionally, but prefers to be sub.' },
                                                                           { display_value: 'switch', value: 5, description: 'Equal parts dom and sub.' },
                                                                           { display_value: 'switchy dom', value: 6, description: 'Switchy dom.  A switch who leans dom.  Might sub occasionally, but prefers to be dom.' },
                                                                           { display_value: 'dom', value: 7, description: 'Predominantly dominant, but might enjoy subbing for the right guy or under the right circumstances.' },
                                                                           { display_value: 'mostly dom', value: 8, description: 'Mostly dominant, but not an arrogant asshole about it.  Knows how to let his hair down on occasion.' },
                                                                           { display_value: 'beta dom', value: 9, description: 'Mostly dominant; might defer (but never submit) to an alpha dom' },
                                                                           { display_value: 'alpha dom', value: 10, description: 'Total dominant arrogant-as-fuck Alpha male.  The man exudes dominance whenever he walks into a room.  {{subject}} NEVER submits.  To anyone.' },
                                                                         ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'drug use').id).blank?
  FieldTemplate.find_or_create_by(name: 'drug use').field_values.create([
                                                                          { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t selected whether {{subject}} uses recreational drugs (yet)', default: true },
                                                                          { display_value: 'addict', value: -99_999, description: '{{subject}} {{be}} a drug addict' },
                                                                          { display_value: 'junkie', value: -99_998, description: '{{subject}} {{be}} a junkie' },
                                                                          { display_value: 'yes, heavily', value: -999, description: '{{subject}} {{verb:use}} recreational drugs a lot' },
                                                                          { display_value: 'yes', value: -10, description: '{{subject}} {{verb:use}} recreational drugs' },
                                                                          { display_value: 'socially', value: -1, description: '{{subject}} {{verb:use}} recreational drugs when {{subject}}\'s out with friends' },
                                                                          { display_value: 'quitting', value: -0.5, description: '{{subject}} {{be}} trying to quit using recreational drugs' },
                                                                          { display_value: 'no', value: 0, description: '{{subject}} {{do}}n\'t use recreational drugs' },
                                                                          { display_value: 'in recovery', value: 999, description: '{{subject}} {{be}} in recovery from drug addiction' },
                                                                          { display_value: 'fuck no', value: 99_999, description: '{{subject}} {{have}} never and will never use recreational drugs' },
                                                                        ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'drugs of choice').id).blank?
  FieldTemplate.find_or_create_by(name: 'drugs of choice').field_values.create([
                                                                                 { value: nil, display_value: '[not entered]', description: '{{subject}} {{have}}n\'t entered any drugs of choice (yet)', default: true },
                                                                               ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'kinks/fetishes').id).blank?
  FieldTemplate.find_or_create_by(name: 'kinks/fetishes').field_values.create([
                                                                                { value: nil, display_value: '[not entered]', description: '{{subject}} {{have}}n\'t entered any kinks or fetishes (yet)', default: true },
                                                                              ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'body hair').id).blank?
  FieldTemplate.find_or_create_by(name: 'body hair').field_values.create([
                                                                           { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t entered {{possessive}} body hair (yet)', default: true },
                                                                           { display_value: 'naturally smooth', value: 0, description: '{{subject}} {{have}} a naturally smooth body' },
                                                                           { display_value: 'shaved smooth', value: 1, description: '{{subject}} {{verb:shave}} {{possessive}} hair off' },
                                                                           { display_value: 'trimmed', value: 1, description: '{{subject}} {{verb:trim}} {{possessive}} body hair' },
                                                                           { display_value: 'some hair', value: 2, description: '{{subject}} {{have}} some hair on {{possessive}} body' },
                                                                           { display_value: 'hairy', value: 3, description: '{{subject}} {{be}} hairy' },
                                                                           { display_value: 'very hairy', value: 4, description: '{{subject}} {{have}} lots of body hair' },
                                                                           { display_value: 'sasquatch', value: 5, description: '{{subject}} might as well be fucking Bigfoot!' },
                                                                         ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'height').id).blank?
  FieldTemplate.find_or_create_by(name: 'height').field_values.create([
                                                                        { value: nil, display_value: '[not entered]', description: '{{subject}} {{have}}n\'t entered {{possessive}} height (yet)', default: true },
                                                                        { display_value: '2ft (61cm)', value: 24, description: '2ft' },
                                                                        { display_value: '2ft 1in (64cm)', value: 25, description: '2ft 1in' },
                                                                        { display_value: '2ft 2in (66cm)', value: 26, description: '2ft 2in' },
                                                                        { display_value: '2ft 3in (69cm)', value: 27, description: '2ft 3in' },
                                                                        { display_value: '2ft 4in (71cm)', value: 28, description: '2ft 4in' },
                                                                        { display_value: '2ft 5in (74cm)', value: 29, description: '2ft 5in' },
                                                                        { display_value: '2ft 6in (76cm)', value: 30, description: '2ft 6in' },
                                                                        { display_value: '2ft 7in (79cm)', value: 31, description: '2ft 7in' },
                                                                        { display_value: '2ft 8in (81cm)', value: 32, description: '2ft 8in' },
                                                                        { display_value: '2ft 9in (84cm)', value: 33, description: '2ft 9in' },
                                                                        { display_value: '2ft 10in (86cm)', value: 34, description: '2ft 10in' },
                                                                        { display_value: '2ft 11in (89cm)', value: 35, description: '2ft 11in' },
                                                                        { display_value: '3ft (91cm)', value: 36, description: '3ft' },
                                                                        { display_value: '3ft 1in (94cm)', value: 37, description: '3ft 1in' },
                                                                        { display_value: '3ft 2in (97cm)', value: 38, description: '3ft 2in' },
                                                                        { display_value: '3ft 3in (99cm)', value: 39, description: '3ft 3in' },
                                                                        { display_value: '3ft 4in (102cm)', value: 40, description: '3ft 4in' },
                                                                        { display_value: '3ft 5in (104cm)', value: 41, description: '3ft 5in' },
                                                                        { display_value: '3ft 6in (107cm)', value: 42, description: '3ft 6in' },
                                                                        { display_value: '3ft 7in (109cm)', value: 43, description: '3ft 7in' },
                                                                        { display_value: '3ft 8in (112cm)', value: 44, description: '3ft 8in' },
                                                                        { display_value: '3ft 9in (114cm)', value: 45, description: '3ft 9in' },
                                                                        { display_value: '3ft 10in (117cm)', value: 46, description: '3ft 10in' },
                                                                        { display_value: '3ft 11in (119cm)', value: 47, description: '3ft 11in' },
                                                                        { display_value: '4ft (122cm)', value: 48, description: '4ft' },
                                                                        { display_value: '4ft 1in (124cm)', value: 49, description: '4ft 1in' },
                                                                        { display_value: '4ft 2in (127cm)', value: 50, description: '4ft 2in' },
                                                                        { display_value: '4ft 3in (130cm)', value: 51, description: '4ft 3in' },
                                                                        { display_value: '4ft 4in (132cm)', value: 52, description: '4ft 4in' },
                                                                        { display_value: '4ft 5in (135cm)', value: 53, description: '4ft 5in' },
                                                                        { display_value: '4ft 6in (137cm)', value: 54, description: '4ft 6in' },
                                                                        { display_value: '4ft 7in (140cm)', value: 55, description: '4ft 7in' },
                                                                        { display_value: '4ft 8in (142cm)', value: 56, description: '4ft 8in' },
                                                                        { display_value: '4ft 9in (145cm)', value: 57, description: '4ft 9in' },
                                                                        { display_value: '4ft 10in (147cm)', value: 58, description: '4ft 10in' },
                                                                        { display_value: '4ft 11in (150cm)', value: 59, description: '4ft 11in' },
                                                                        { display_value: '5ft (152cm)', value: 60, description: '5ft' },
                                                                        { display_value: '5ft 1in (155cm)', value: 61, description: '5ft 1in' },
                                                                        { display_value: '5ft 2in (157cm)', value: 62, description: '5ft 2in' },
                                                                        { display_value: '5ft 3in (160cm)', value: 63, description: '5ft 3in' },
                                                                        { display_value: '5ft 4in (163cm)', value: 64, description: '5ft 4in' },
                                                                        { display_value: '5ft 5in (165cm)', value: 65, description: '5ft 5in' },
                                                                        { display_value: '5ft 6in (168cm)', value: 66, description: '5ft 6in' },
                                                                        { display_value: '5ft 7in (170cm)', value: 67, description: '5ft 7in' },
                                                                        { display_value: '5ft 8in (173cm)', value: 68, description: '5ft 8in' },
                                                                        { display_value: '5ft 9in (175cm)', value: 69, description: '5ft 9in' },
                                                                        { display_value: '5ft 10in (178cm)', value: 70, description: '5ft 10in' },
                                                                        { display_value: '5ft 11in (180cm)', value: 71, description: '5ft 11in' },
                                                                        { display_value: '6ft (183cm)', value: 72, description: '6ft' },
                                                                        { display_value: '6ft 1in (185cm)', value: 73, description: '6ft 1in' },
                                                                        { display_value: '6ft 2in (188cm)', value: 74, description: '6ft 2in' },
                                                                        { display_value: '6ft 3in (191cm)', value: 75, description: '6ft 3in' },
                                                                        { display_value: '6ft 4in (193cm)', value: 76, description: '6ft 4in' },
                                                                        { display_value: '6ft 5in (196cm)', value: 77, description: '6ft 5in' },
                                                                        { display_value: '6ft 6in (198cm)', value: 78, description: '6ft 6in' },
                                                                        { display_value: '6ft 7in (201cm)', value: 79, description: '6ft 7in' },
                                                                        { display_value: '6ft 8in (203cm)', value: 80, description: '6ft 8in' },
                                                                        { display_value: '6ft 9in (206cm)', value: 81, description: '6ft 9in' },
                                                                        { display_value: '6ft 10in (208cm)', value: 82, description: '6ft 10in' },
                                                                        { display_value: '6ft 11in (211cm)', value: 83, description: '6ft 11in' },
                                                                        { display_value: '7ft (213cm)', value: 84, description: '7ft' },
                                                                        { display_value: '7ft 1in (216cm)', value: 85, description: '7ft 1in' },
                                                                        { display_value: '7ft 2in (218cm)', value: 86, description: '7ft 2in' },
                                                                        { display_value: '7ft 3in (221cm)', value: 87, description: '7ft 3in' },
                                                                        { display_value: '7ft 4in (224cm)', value: 88, description: '7ft 4in' },
                                                                        { display_value: '7ft 5in (226cm)', value: 89, description: '7ft 5in' },
                                                                        { display_value: '7ft 6in (229cm)', value: 90, description: '7ft 6in' },
                                                                        { display_value: '7ft 7in (231cm)', value: 91, description: '7ft 7in' },
                                                                        { display_value: '7ft 8in (234cm)', value: 92, description: '7ft 8in' },
                                                                        { display_value: '7ft 9in (236cm)', value: 93, description: '7ft 9in' },
                                                                        { display_value: '7ft 10in (239cm)', value: 94, description: '7ft 10in' },
                                                                        { display_value: '7ft 11in (241cm)', value: 95, description: '7ft 11in' },
                                                                      ])
end

if FieldValue.find_by(field_template_id: FieldTemplate.find_by(name: 'weight').id).blank?
  FieldTemplate.find_or_create_by(name: 'weight').field_values.create([
                                                                        { display_value: '[not entered]', value: nil, description: '{{subject}} {{have}}n\'t entered {{possessive}} weight (yet)', default: true },
                                                                        { display_value: '90lbs (41kg)', value: 90, description: '90lbs' },
                                                                        { display_value: '95lbs (43kg)', value: 95, description: '95lbs' },
                                                                        { display_value: '100lbs (45kg)', value: 100, description: '100lbs' },
                                                                        { display_value: '105lbs (48kg)', value: 105, description: '105lbs' },
                                                                        { display_value: '110lbs (50kg)', value: 110, description: '110lbs' },
                                                                        { display_value: '115lbs (52kg)', value: 115, description: '115lbs' },
                                                                        { display_value: '120lbs (54kg)', value: 120, description: '120lbs' },
                                                                        { display_value: '125lbs (57kg)', value: 125, description: '125lbs' },
                                                                        { display_value: '130lbs (59kg)', value: 130, description: '130lbs' },
                                                                        { display_value: '135lbs (61kg)', value: 135, description: '135lbs' },
                                                                        { display_value: '140lbs (64kg)', value: 140, description: '140lbs' },
                                                                        { display_value: '145lbs (66kg)', value: 145, description: '145lbs' },
                                                                        { display_value: '150lbs (68kg)', value: 150, description: '150lbs' },
                                                                        { display_value: '155lbs (70kg)', value: 155, description: '155lbs' },
                                                                        { display_value: '160lbs (73kg)', value: 160, description: '160lbs' },
                                                                        { display_value: '165lbs (75kg)', value: 165, description: '165lbs' },
                                                                        { display_value: '170lbs (77kg)', value: 170, description: '170lbs' },
                                                                        { display_value: '175lbs (79kg)', value: 175, description: '175lbs' },
                                                                        { display_value: '180lbs (82kg)', value: 180, description: '180lbs' },
                                                                        { display_value: '185lbs (84kg)', value: 185, description: '185lbs' },
                                                                        { display_value: '190lbs (86kg)', value: 190, description: '190lbs' },
                                                                        { display_value: '195lbs (88kg)', value: 195, description: '195lbs' },
                                                                        { display_value: '200lbs (91kg)', value: 200, description: '200lbs' },
                                                                        { display_value: '205lbs (93kg)', value: 205, description: '205lbs' },
                                                                        { display_value: '210lbs (95kg)', value: 210, description: '210lbs' },
                                                                        { display_value: '215lbs (98kg)', value: 215, description: '215lbs' },
                                                                        { display_value: '220lbs (100kg)', value: 220, description: '220lbs' },
                                                                        { display_value: '225lbs (102kg)', value: 225, description: '225lbs' },
                                                                        { display_value: '230lbs (104kg)', value: 230, description: '230lbs' },
                                                                        { display_value: '235lbs (107kg)', value: 235, description: '235lbs' },
                                                                        { display_value: '240lbs (109kg)', value: 240, description: '240lbs' },
                                                                        { display_value: '245lbs (111kg)', value: 245, description: '245lbs' },
                                                                        { display_value: '250lbs (113kg)', value: 250, description: '250lbs' },
                                                                        { display_value: '255lbs (116kg)', value: 255, description: '255lbs' },
                                                                        { display_value: '260lbs (118kg)', value: 260, description: '260lbs' },
                                                                        { display_value: '265lbs (120kg)', value: 265, description: '265lbs' },
                                                                        { display_value: '270lbs (122kg)', value: 270, description: '270lbs' },
                                                                        { display_value: '275lbs (125kg)', value: 275, description: '275lbs' },
                                                                        { display_value: '280lbs (127kg)', value: 280, description: '280lbs' },
                                                                        { display_value: '285lbs (129kg)', value: 285, description: '285lbs' },
                                                                        { display_value: '290lbs (132kg)', value: 290, description: '290lbs' },
                                                                        { display_value: '295lbs (134kg)', value: 295, description: '295lbs' },
                                                                        { display_value: '300lbs (136kg)', value: 300, description: '300lbs' },
                                                                        { display_value: '305lbs (138kg)', value: 305, description: '305lbs' },
                                                                      ])
end
