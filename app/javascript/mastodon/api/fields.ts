/* 
 * fields.ts
 *     Created: 2024-09-18T05:25:52-04:00
 *    Modified: 2024-09-18T05:25:52-04:00
 *      Author: Justin Paul Chase <justin@justinwritescode.com>
 *   Copyright: © 2024 Justin Paul Chase, All Rights Reserved
 *     License: MIT (https://opensource.org/licenses/MIT)
 */ 

import { apiRequestGet } from 'mastodon/api';
import type { FieldTemplateJSON } from 'mastodon/api_types/field_template';

export const apiGetFieldTemplates = () =>
  apiRequestGet<FieldTemplateJSON[]>('vnext/fields/templates.json', {});
