% Knowledge Base: Electronic Devices and Components

% is_a relationships (родо-видові зв'язки)
is_a(smartphone, mobile_device).
is_a(tablet, mobile_device).
is_a(laptop, computer).
is_a(desktop, computer).
is_a(mobile_device, electronic_device).
is_a(computer, electronic_device).
is_a(smartwatch, wearable_device).
is_a(fitness_tracker, wearable_device).
is_a(wearable_device, electronic_device).
is_a(lcd_display, display).
is_a(oled_display, display).
is_a(display, electronic_component).
is_a(ssd, storage_device).
is_a(hdd, storage_device).
is_a(storage_device, electronic_component).

% part_of relationships (зв'язки частина-ціле)
part_of(battery, smartphone).
part_of(screen, smartphone).
part_of(processor, smartphone).
part_of(camera, smartphone).
part_of(memory, smartphone).
part_of(processor, computer).
part_of(memory, computer).
part_of(storage, computer).
part_of(motherboard, computer).
part_of(power_supply, computer).
part_of(screen, tablet).
part_of(battery, tablet).
part_of(processor, tablet).
part_of(screen, smartwatch).
part_of(battery, smartwatch).

% Rules for inheritance and transitivity

% Транзитивність для is_a (родо-видових зв'язків)
is_a_transitive(X, Z) :- is_a(X, Z).
is_a_transitive(X, Z) :- is_a(X, Y), is_a_transitive(Y, Z).

% Транзитивність для part_of (зв'язків частина-ціле)
part_of_transitive(X, Z) :- part_of(X, Z).
part_of_transitive(X, Z) :- part_of(X, Y), part_of_transitive(Y, Z).

% Правило наслідування частин
has_part(Device, Part) :- part_of(Part, Device).
has_part(Device, Part) :- is_a(Device, Parent), part_of(Part, Parent).

% Initialization and queries
:- initialization(main).

main :-
    write('Knowledge Base loaded successfully.'), nl,
    write('Example queries:'), nl,
    write('1. ?- is_a_transitive(smartphone, electronic_device).'), nl,
    write('2. ?- part_of_transitive(battery, tablet).'), nl,
    write('3. ?- has_part(smartphone, screen).'), nl.

% Example queries to test the knowledge base:
% ?- is_a_transitive(smartphone, electronic_device).
% ?- part_of(battery, smartphone).
% ?- has_part(tablet, processor).
% ?- is_a_transitive(smartwatch, electronic_device). 