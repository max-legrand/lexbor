const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Add all C source files
    const core_src = [_][]const u8{
        "lexbor/source/lexbor/core/array.c",
        "lexbor/source/lexbor/core/array_obj.c",
        "lexbor/source/lexbor/core/avl.c",
        "lexbor/source/lexbor/core/bst.c",
        "lexbor/source/lexbor/core/bst_map.c",
        "lexbor/source/lexbor/core/conv.c",
        "lexbor/source/lexbor/core/diyfp.c",
        "lexbor/source/lexbor/core/dobject.c",
        "lexbor/source/lexbor/core/dtoa.c",
        "lexbor/source/lexbor/core/hash.c",
        "lexbor/source/lexbor/core/in.c",
        "lexbor/source/lexbor/core/mem.c",
        "lexbor/source/lexbor/core/mraw.c",
        "lexbor/source/lexbor/core/plog.c",
        "lexbor/source/lexbor/core/print.c",
        "lexbor/source/lexbor/core/serialize.c",
        "lexbor/source/lexbor/core/shs.c",
        "lexbor/source/lexbor/core/str.c",
        "lexbor/source/lexbor/core/strtod.c",
        "lexbor/source/lexbor/core/utils.c",
    };

    const css_src = [_][]const u8{
        "lexbor/source/lexbor/css/at_rule/state.c",
        "lexbor/source/lexbor/css/at_rule.c",
        "lexbor/source/lexbor/css/css.c",
        "lexbor/source/lexbor/css/declaration.c",
        "lexbor/source/lexbor/css/log.c",
        "lexbor/source/lexbor/css/parser.c",
        "lexbor/source/lexbor/css/property/state.c",
        "lexbor/source/lexbor/css/property.c",
        "lexbor/source/lexbor/css/rule.c",
        "lexbor/source/lexbor/css/selectors/pseudo.c",
        "lexbor/source/lexbor/css/selectors/pseudo_state.c",
        "lexbor/source/lexbor/css/selectors/selector.c",
        "lexbor/source/lexbor/css/selectors/selectors.c",
        "lexbor/source/lexbor/css/selectors/state.c",
        "lexbor/source/lexbor/css/state.c",
        "lexbor/source/lexbor/css/stylesheet.c",
        "lexbor/source/lexbor/css/syntax/anb.c",
        "lexbor/source/lexbor/css/syntax/parser.c",
        "lexbor/source/lexbor/css/syntax/state.c",
        "lexbor/source/lexbor/css/syntax/syntax.c",
        "lexbor/source/lexbor/css/syntax/token.c",
        "lexbor/source/lexbor/css/syntax/tokenizer/error.c",
        "lexbor/source/lexbor/css/syntax/tokenizer.c",
        "lexbor/source/lexbor/css/unit.c",
        "lexbor/source/lexbor/css/value.c",
    };

    const dom_src = [_][]const u8{
        "lexbor/source/lexbor/dom/collection.c",
        "lexbor/source/lexbor/dom/exception.c",
        "lexbor/source/lexbor/dom/interface.c",
        "lexbor/source/lexbor/dom/interfaces/attr.c",
        "lexbor/source/lexbor/dom/interfaces/cdata_section.c",
        "lexbor/source/lexbor/dom/interfaces/character_data.c",
        "lexbor/source/lexbor/dom/interfaces/comment.c",
        "lexbor/source/lexbor/dom/interfaces/document.c",
        "lexbor/source/lexbor/dom/interfaces/document_fragment.c",
        "lexbor/source/lexbor/dom/interfaces/document_type.c",
        "lexbor/source/lexbor/dom/interfaces/element.c",
        "lexbor/source/lexbor/dom/interfaces/event_target.c",
        "lexbor/source/lexbor/dom/interfaces/node.c",
        "lexbor/source/lexbor/dom/interfaces/processing_instruction.c",
        "lexbor/source/lexbor/dom/interfaces/shadow_root.c",
        "lexbor/source/lexbor/dom/interfaces/text.c",
    };

    const encoding_src = [_][]const u8{
        "lexbor/source/lexbor/encoding/decode.c",
        "lexbor/source/lexbor/encoding/encode.c",
        "lexbor/source/lexbor/encoding/encoding.c",
        "lexbor/source/lexbor/encoding/range.c",
        "lexbor/source/lexbor/encoding/res.c",
        "lexbor/source/lexbor/encoding/single.c",
    };

    const html_src = [_][]const u8{
        "lexbor/source/lexbor/html/encoding.c",
        "lexbor/source/lexbor/html/interface.c",
        "lexbor/source/lexbor/html/interfaces/anchor_element.c",
        "lexbor/source/lexbor/html/interfaces/area_element.c",
        "lexbor/source/lexbor/html/interfaces/audio_element.c",
        "lexbor/source/lexbor/html/interfaces/base_element.c",
        "lexbor/source/lexbor/html/interfaces/body_element.c",
        "lexbor/source/lexbor/html/interfaces/br_element.c",
        "lexbor/source/lexbor/html/interfaces/button_element.c",
        "lexbor/source/lexbor/html/interfaces/canvas_element.c",
        "lexbor/source/lexbor/html/interfaces/d_list_element.c",
        "lexbor/source/lexbor/html/interfaces/data_element.c",
        "lexbor/source/lexbor/html/interfaces/data_list_element.c",
        "lexbor/source/lexbor/html/interfaces/details_element.c",
        "lexbor/source/lexbor/html/interfaces/dialog_element.c",
        "lexbor/source/lexbor/html/interfaces/directory_element.c",
        "lexbor/source/lexbor/html/interfaces/div_element.c",
        "lexbor/source/lexbor/html/interfaces/document.c",
        "lexbor/source/lexbor/html/interfaces/element.c",
        "lexbor/source/lexbor/html/interfaces/embed_element.c",
        "lexbor/source/lexbor/html/interfaces/field_set_element.c",
        "lexbor/source/lexbor/html/interfaces/font_element.c",
        "lexbor/source/lexbor/html/interfaces/form_element.c",
        "lexbor/source/lexbor/html/interfaces/frame_element.c",
        "lexbor/source/lexbor/html/interfaces/frame_set_element.c",
        "lexbor/source/lexbor/html/interfaces/head_element.c",
        "lexbor/source/lexbor/html/interfaces/heading_element.c",
        "lexbor/source/lexbor/html/interfaces/hr_element.c",
        "lexbor/source/lexbor/html/interfaces/html_element.c",
        "lexbor/source/lexbor/html/interfaces/iframe_element.c",
        "lexbor/source/lexbor/html/interfaces/image_element.c",
        "lexbor/source/lexbor/html/interfaces/input_element.c",
        "lexbor/source/lexbor/html/interfaces/label_element.c",
        "lexbor/source/lexbor/html/interfaces/legend_element.c",
        "lexbor/source/lexbor/html/interfaces/li_element.c",
        "lexbor/source/lexbor/html/interfaces/link_element.c",
        "lexbor/source/lexbor/html/interfaces/map_element.c",
        "lexbor/source/lexbor/html/interfaces/marquee_element.c",
        "lexbor/source/lexbor/html/interfaces/media_element.c",
        "lexbor/source/lexbor/html/interfaces/menu_element.c",
        "lexbor/source/lexbor/html/interfaces/meta_element.c",
        "lexbor/source/lexbor/html/interfaces/meter_element.c",
        "lexbor/source/lexbor/html/interfaces/mod_element.c",
        "lexbor/source/lexbor/html/interfaces/o_list_element.c",
        "lexbor/source/lexbor/html/interfaces/object_element.c",
        "lexbor/source/lexbor/html/interfaces/opt_group_element.c",
        "lexbor/source/lexbor/html/interfaces/option_element.c",
        "lexbor/source/lexbor/html/interfaces/output_element.c",
        "lexbor/source/lexbor/html/interfaces/paragraph_element.c",
        "lexbor/source/lexbor/html/interfaces/param_element.c",
        "lexbor/source/lexbor/html/interfaces/picture_element.c",
        "lexbor/source/lexbor/html/interfaces/pre_element.c",
        "lexbor/source/lexbor/html/interfaces/progress_element.c",
        "lexbor/source/lexbor/html/interfaces/quote_element.c",
        "lexbor/source/lexbor/html/interfaces/script_element.c",
        "lexbor/source/lexbor/html/interfaces/select_element.c",
        "lexbor/source/lexbor/html/interfaces/slot_element.c",
        "lexbor/source/lexbor/html/interfaces/source_element.c",
        "lexbor/source/lexbor/html/interfaces/span_element.c",
        "lexbor/source/lexbor/html/interfaces/style_element.c",
        "lexbor/source/lexbor/html/interfaces/table_caption_element.c",
        "lexbor/source/lexbor/html/interfaces/table_cell_element.c",
        "lexbor/source/lexbor/html/interfaces/table_col_element.c",
        "lexbor/source/lexbor/html/interfaces/table_element.c",
        "lexbor/source/lexbor/html/interfaces/table_row_element.c",
        "lexbor/source/lexbor/html/interfaces/table_section_element.c",
        "lexbor/source/lexbor/html/interfaces/template_element.c",
        "lexbor/source/lexbor/html/interfaces/text_area_element.c",
        "lexbor/source/lexbor/html/interfaces/time_element.c",
        "lexbor/source/lexbor/html/interfaces/title_element.c",
        "lexbor/source/lexbor/html/interfaces/track_element.c",
        "lexbor/source/lexbor/html/interfaces/u_list_element.c",
        "lexbor/source/lexbor/html/interfaces/unknown_element.c",
        "lexbor/source/lexbor/html/interfaces/video_element.c",
        "lexbor/source/lexbor/html/interfaces/window.c",
        "lexbor/source/lexbor/html/node.c",
        "lexbor/source/lexbor/html/parser.c",
        "lexbor/source/lexbor/html/serialize.c",
        "lexbor/source/lexbor/html/token.c",
        "lexbor/source/lexbor/html/token_attr.c",
        "lexbor/source/lexbor/html/tokenizer/error.c",
        "lexbor/source/lexbor/html/tokenizer/state.c",
        "lexbor/source/lexbor/html/tokenizer/state_comment.c",
        "lexbor/source/lexbor/html/tokenizer/state_doctype.c",
        "lexbor/source/lexbor/html/tokenizer/state_rawtext.c",
        "lexbor/source/lexbor/html/tokenizer/state_rcdata.c",
        "lexbor/source/lexbor/html/tokenizer/state_script.c",
        "lexbor/source/lexbor/html/tokenizer.c",
        "lexbor/source/lexbor/html/tree/active_formatting.c",
        "lexbor/source/lexbor/html/tree/error.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/after_after_body.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/after_after_frameset.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/after_body.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/after_frameset.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/after_head.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/before_head.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/before_html.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/foreign_content.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_body.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_caption.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_cell.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_column_group.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_frameset.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_head.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_head_noscript.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_row.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_select.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_select_in_table.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_table.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_table_body.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_table_text.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/in_template.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/initial.c",
        "lexbor/source/lexbor/html/tree/insertion_mode/text.c",
        "lexbor/source/lexbor/html/tree/open_elements.c",
        "lexbor/source/lexbor/html/tree/template_insertion.c",
        "lexbor/source/lexbor/html/tree.c",
    };

    const ns_src = [_][]const u8{
        "lexbor/source/lexbor/ns/ns.c",
    };

    const ports_src = [_][]const u8{
        "lexbor/source/lexbor/ports/windows_nt/lexbor/core/fs.c",
        "lexbor/source/lexbor/ports/windows_nt/lexbor/core/memory.c",
        "lexbor/source/lexbor/ports/windows_nt/lexbor/core/perf.c",
    };

    const punycode_src = [_][]const u8{
        "lexbor/source/lexbor/punycode/punycode.c",
    };

    const selectors_src = [_][]const u8{
        "lexbor/source/lexbor/selectors/selectors.c",
    };

    const tag_src = [_][]const u8{
        "lexbor/source/lexbor/tag/tag.c",
    };

    const unicode_src = [_][]const u8{
        "lexbor/source/lexbor/unicode/idna.c",
        "lexbor/source/lexbor/unicode/unicode.c",
    };

    const url_src = [_][]const u8{
        "lexbor/source/lexbor/url/url.c",
    };

    const utils_src = [_][]const u8{
        "lexbor/source/lexbor/utils/http.c",
        "lexbor/source/lexbor/utils/warc.c",
    };

    var sources_list = std.ArrayList([]const u8).init(b.allocator);
    for (core_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (css_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (dom_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (encoding_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (html_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (ns_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (punycode_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (selectors_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (tag_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (unicode_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (url_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    for (utils_src) |src| sources_list.append(src) catch @panic("Failed to add to list");

    if (target.query.os_tag == .windows) {
        for (ports_src) |src| sources_list.append(src) catch @panic("Failed to add to list");
    }

    const lib = b.addStaticLibrary(.{
        .name = "lexbor",
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    for (sources_list.items) |src| {
        lib.addCSourceFile(.{ .file = b.path(src), .flags = &.{} });
    }

    lib.addIncludePath(b.path("lexbor/source"));
    lib.addIncludePath(b.path("lexbor/source/lexbor"));

    b.installArtifact(lib);
}
