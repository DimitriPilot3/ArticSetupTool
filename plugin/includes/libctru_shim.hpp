#include "3ds.h"

#include <concepts>

namespace {
	/**
	 * @deprecated This is a shim for the legacy signature of this function. Starting with libctru 2.7.0 you should use AM_GetDeviceId(s32* outInternalResult, u32* outDeviceId).
	 */
	template <typename T = void>
		requires std::invocable<decltype(::AM_GetDeviceId), s32*, u32*>
	inline Result AM_GetDeviceId(u32* outDeviceId) {
		s32 internalResult;
		return ::AM_GetDeviceId(&internalResult, outDeviceId);
	}
}
