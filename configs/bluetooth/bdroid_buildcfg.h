/*
 *
 *  Copyright (c) 2013, The Linux Foundation. All rights reserved.
 *  Not a Contribution, Apache license notifications and license are retained
 *  for attribution purposes only.
 *
 * Copyright (C) 2012 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

#define BTA_AV_MAX_A2DP_MTU  1788
#define BLE_INCLUDED TRUE
#define BTA_GATT_INCLUDED TRUE
#define SMP_INCLUDED TRUE

// Hack to keep PnP version instead of HID version
// Needed to differentiate Amazon remote SKUs
#include <gattdefs.h>
#undef GATT_UUID_HID_INFORMATION
#define GATT_UUID_HID_INFORMATION 0

#endif
